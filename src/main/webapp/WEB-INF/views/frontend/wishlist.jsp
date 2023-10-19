<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="base">
  <layout:put block="content">
    <main>
<c:set value="${it[1]}" var="count"/>
      <!-- section -->
      <section class="mt-8 mb-14">
        <div class="container">
          <!-- row -->
          <div class="row">
            <div class="col-lg-12">
              <div class="mb-8">
                <!-- heading -->
                <h1 class="mb-1">My Wishlist</h1>
                <p>There are ${count} products in this wishlist.</p>
              </div>
              <div>
                <!-- table -->
                <div class="table-responsive">
                  <table class="table text-nowrap table-with-checkbox">
                    <thead class="table-light">
                    <tr>
                      <th>
                        <!-- form check -->
                        <div class="form-check">
                          <!-- input --><input class="form-check-input" type="checkbox" value="" id="checkAll">
                          <!-- label --><label class="form-check-label" for="checkAll">

                        </label>
                        </div>
                      </th>
                      <th></th>
                      <th>Product</th>
                      <th>Amount</th>
                      <th>Status</th>
                      <th>Actions</th>
                      <th>Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${it[0]}" var="items" >
                      <tr>

                        <td class="align-middle">
                          <!-- form check -->
                          <div class="form-check">
                            <!-- input --><input class="form-check-input" type="checkbox" value="" id="chechboxTwo">
                            <!-- label --><label class="form-check-label" for="chechboxTwo">

                          </label>
                          </div>

                        </td>
                        <td class="align-middle">
                         <c:forEach items="${items.productId.images}" var="image" end="0">
                           <a href="#"><img src="${BASE_URL}${image}"
                                            class="icon-shape icon-xxl" alt=""></a>
                         </c:forEach>

                        </td>
                        <td class="align-middle">
                          <div>
                            <h5 class="fs-6 mb-0"><a href="#" class="text-inherit">${items.productId.title}</a></h5>
                            <small>$${items.productId.weight} / ${items.productId.unit}</small>
                          </div>
                        </td>
                        <td class="align-middle">$${items.productId.sale_price}0</td>
                        <c:choose>
                          <c:when test="${items.productId.inStock}">
                            <td class="align-middle"><span class="badge bg-success">In Stock</span></td>
                          </c:when>
                          <c:otherwise>
                            <td class="align-middle"><span class="badge bg-danger">Out of Stock</span></td>
                          </c:otherwise>
                        </c:choose>

                        <td class="align-middle">
                          <div class="btn btn-primary btn-sm" onclick="addToCart(${items.productId.id})">Add to Cart</div>
                        </td>
                        <td class="align-middle "><a href="#" class="text-muted" onclick="deleteItem(${items.id})" title="Delete">
                          <i class="feather-icon icon-trash-2"></i>
                        </a></td>
                      </tr>
                    </c:forEach>


                    </tbody>
                  </table>
                </div>

              </div>
            </div>

          </div>



        </div>

      </section>
    </main>
  </layout:put>
  <layout:put block="script">
    <script>
      function addToCart(id) {
        let qty = document.getElementById("qty").value;

        let options = {
          method: 'post',
          headers: {

            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            id: id,
            qty: qty,

          })
        }


        secureFetch("${BASE_URL}api/cart", options).then(response => response.text())
                .then(text => {
                          if (text == "Success") {
                            window.location.href = "${BASE_URL}cart";

                          } else {
                            alert(text)
                          }
                        }
                );
      }
      function deleteItem(id){
        let formData = new FormData();
        formData.append("id",id);
        let options = {
          method:'delete',
          body:formData
        }
        secureFetch("${BASE_URL}api/wishlist", options).then(response => {
          if(response.ok){
            alert("product removed successfully");
            window.location.href = "${BASE_URL}wishlist";
          }else{
            alert(response.text())
          }
        }).then();
      }
    </script>
  </layout:put>
</layout:extends>