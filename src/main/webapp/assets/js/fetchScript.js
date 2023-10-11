function secureFetch(url, options = {}) {
    const token = localStorage.getItem("accessToken");
    const expireIn = localStorage.getItem("expireIn");
    const expireAt = new Date(Number(expireIn)).getTime();
    const expireGate = new Date().getTime() + 2 * 60 * 1000;
    if (token && expireAt && expireAt < expireGate) {
        return refreshToken().then(newToken=>{
            options.headers = {
                ...options.headers,
                Authorization: 'Bearer '+newToken
            }
            return fetch(url,options)
        })
    }
    if(token){
        options.headers={
            ...options.headers,
            'Authorization': 'Bearer '+token,

        }

    }else{
        console.log("Token Unavailable");
        window.location.href = `${BASE_URL}signin`
    }
    return fetch(url,options)
}

function refreshToken() {
    const oldRefreshToken = localStorage.getItem("refreshToken");
    const formData = new URLSearchParams();
    formData.append('token', oldRefreshToken);
    if (oldRefreshToken) {
        return fetch(`${BASE_URL}signin/refresh-token`, {
            method: 'post',
            header: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: formData,
        }).then(response => {
            if (!response.ok) {
                window.location.href = `${BASE_URL}signin`
            }
            return response.json();
        }).then(data => {
            localStorage.setItem("accessToken", data.accessToken);
            localStorage.setItem("refreshToken", data.refreshToken);
            localStorage.setItem("expireIn", data.expireIn);
            return data.accessToken;
        })
    } else {
        localStorage.removeItem("accessToken");
        localStorage.removeItem("expireIn");
        window.location.href = `${BASE_URL}signin`
    }
}