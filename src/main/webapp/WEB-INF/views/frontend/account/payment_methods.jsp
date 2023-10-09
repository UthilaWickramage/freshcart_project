<%@taglib prefix="layout" uri="http://callidora.lk/jsp/template-inheritance" %>
<layout:extends name="base">
    <layout:put block="content">
        <main>
            <!-- section -->
            <section>
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- col -->
                        <jsp:include page="../include/account_menu.jsp"/>
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="py-6 p-md-6 p-lg-10">
                                <!-- heading -->
                                <div class="d-flex justify-content-between mb-6 align-items-center">
                                    <h2 class="mb-0">Payment Methods</h2>
                                    <a href="#" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#paymentModal">Add
                                        Payment </a>

                                </div>
                                <ul class="list-group list-group-flush">
                                    <!-- List group item -->
                                    <li class="list-group-item py-5 px-0">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex">
                                                <!-- img -->
                                                <img src="${BASE_URL}assets/images/svg-graphics/visa.svg" alt="">
                                                <!-- text -->
                                                <div class="ms-4">
                                                    <h5 class="mb-0 h6 h6">**** 1234</h5>
                                                    <p class="mb-0 small">Expires in 10/2023
                                                    </p>
                                                </div>
                                            </div>
                                            <div>
                                                <!-- button -->
                                                <a href="#" class="btn btn-outline-gray-400 disabled btn-sm">Remove</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- List group item -->
                                    <li class="list-group-item px-0 py-5">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex">
                                                <!-- img -->
                                                <img src="${BASE_URL}assets/images/svg-graphics/mastercard.svg" alt="" class="me-3">
                                                <div>
                                                    <h5 class="mb-0 h6">Mastercard ending in 1234</h5>
                                                    <p class="mb-0 small">Expires in 03/2026</p>
                                                </div>
                                            </div>
                                            <div>
                                                <!-- button-->
                                                <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- List group item -->
                                    <li class="list-group-item px-0 py-5">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex">
                                                <!-- img -->
                                                <img src="${BASE_URL}assets/images/svg-graphics/discover.svg" alt="" class="me-3">
                                                <div>
                                                    <!-- text -->
                                                    <h5 class="mb-0 h6">Discover ending in 1234</h5>
                                                    <p class="mb-0 small">Expires in 07/2020 <span class="badge bg-warning text-dark"> This card is
                          expired.</span></p>
                                                </div>
                                            </div>
                                            <div>
                                                <!-- btn -->
                                                <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- List group item -->
                                    <li class="list-group-item px-0 py-5">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex">
                                                <!-- img -->
                                                <img src="${BASE_URL}assets/images/svg-graphics/americanexpress.svg" alt="" class="me-3">
                                                <!-- text -->
                                                <div>
                                                    <h5 class="mb-0 h6">American Express ending in 1234</h5>
                                                    <p class="mb-0 small">Expires in 12/2021</p>
                                                </div>
                                            </div>
                                            <div>
                                                <!-- btn -->
                                                <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- List group item -->
                                    <li class="list-group-item px-0 py-5 border-bottom">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex">
                                                <!-- img -->
                                                <img src="${BASE_URL}assets/images/svg-graphics/paypal.svg" alt="" class="me-3">
                                                <div>
                                                    <!-- text -->
                                                    <h5 class="mb-0 h6">Paypal Express ending in 1234</h5>
                                                    <p class="mb-0 small">Expires in 10/2021</p>
                                                </div>
                                            </div>
                                            <div>
                                                <!-- btn -->
                                                <a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Remove</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <!-- modal content -->
                <div class="modal-content">
                    <!-- modal header -->
                    <div class="modal-header align-items-center d-flex">
                        <h5 class="modal-title" id="paymentModalLabel">
                            Add New Payment Method
                        </h5>
                        <!-- button -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div>
                            <!-- Form -->
                            <form class="row mb-4">
                                <div class="mb-3 col-12 col-md-12 mb-4">
                                    <h5 class="mb-3">Credit / Debit card</h5>
                                    <!-- Radio button -->
                                    <div class="d-inline-flex">
                                        <div class="form-check me-2">
                                            <input type="radio" id="paymentRadioOne" name="paymentRadioOne" class="form-check-input" />
                                            <label class="form-check-label" for="paymentRadioOne"><img
                                                    src="${BASE_URL}assets/images/payment/american-express.svg" alt=""></label>
                                        </div>
                                        <!-- Radio button -->
                                        <div class="form-check me-2">
                                            <input type="radio" id="paymentRadioTwo" name="paymentRadioOne" class="form-check-input" />
                                            <label class="form-check-label" for="paymentRadioTwo"><img
                                                    src="${BASE_URL}assets/images/payment/mastercard.svg" alt=""></label>
                                        </div>

                                        <!-- Radio button -->
                                        <div class="form-check">
                                            <input type="radio" id="paymentRadioThree" name="paymentRadioOne" class="form-check-input" />
                                            <label class="form-check-label" for="paymentRadioThree"><img src="${BASE_URL}assets/images/payment/visa.svg"
                                                                                                        alt=""></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- Name on card -->
                                <div class="mb-3 col-12 col-md-4">
                                    <label for="nameoncard" class="form-label">Name on card</label>
                                    <input id="nameoncard" type="text" class="form-control" name="nameoncard" placeholder="Name" required />
                                </div>
                                <!-- Month -->
                                <div class="mb-3 col-12 col-md-4">
                                    <label class="form-label">Month</label>
                                    <select class="form-select" id="month">
                                        <option value="">Month</option>
                                        <option value="01">Jan</option>
                                        <option value="02">Feb</option>
                                        <option value="03">Mar</option>
                                        <option value="04">Apr</option>
                                        <option value="05">May</option>
                                        <option value="06">June</option>
                                        <option value="07">July</option>
                                        <option value="08">Aug</option>
                                        <option value="09">Sep</option>
                                        <option value="10">Oct</option>
                                        <option value="11">Nov</option>
                                        <option value="12">Dec</option>
                                    </select>
                                </div>
                                <!-- Year -->
                                <div class="mb-3 col-12 col-md-4">
                                    <label class="form-label">Year</label>
                                    <select class="form-select" id="year">
                                        <option value="">Year</option>
                                        <option value="22">2022</option>
                                        <option value="23">2023</option>
                                        <option value="24">2024</option>
                                        <option value="25">2025</option>
                                        <option value="26">2026</option>
                                        <option value="27">2027</option>
                                        <option value="28">2028</option>
                                    </select>
                                </div>
                                <!-- Card number -->
                                <div class="mb-3 col-md-8 col-12">
                                    <label for="cc-mask" class="form-label">Card Number</label>
                                    <input type="text" class="form-control" id="cc-mask" data-inputmask="'mask': '9999 9999 9999 9999'" placeholder="xxxx-xxxx-xxxx-xxxx" required />
                                </div>
                                <!-- CVV -->
                                <div class="mb-3 col-md-4 col-12">
                                    <div class="mb-3">
                                        <label for="cvv" class="form-label">CVV Code
                                            <i class="fe fe-help-circle ms-1" data-bs-toggle="tooltip" data-placement="top"
                                               title="A 3 - digit number, typically printed on the back of a card."></i></label>
                                        <input type="password" class="form-control" name="cvv" id="cvv"  data-inputmask="'mask':'999'" placeholder="xxx" maxlength="3" required />
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="col-md-6 col-12">
                                    <button class="btn btn-primary" id="submit" type="submit">
                                        Add New Card
                                    </button>
                                    <button class="btn btn-outline-gray-400 text-muted" type="button" data-bs-dismiss="modal">
                                        Close
                                    </button>
                                </div>
                            </form>
                            <span><strong>Note:</strong> that you can later remove your card at
              the account setting page.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </layout:put>
<layout:put block="script">
    <script>
        document.getElementById('submit').addEventListener('click',()=>{
            let formData = new FormData();
           let radio1 =  document.getElementById('paymentRadioOne')
            let radio2 =  document.getElementById('paymentRadioTwo')
            let radio3 =  document.getElementById('paymentRadioThree')
            let type;
            if(radio1.checked){
                type="american";
            }else if(radio2.checked){
                type="visa";
            }else{
                type="mastercard";
            }
            formData.append("number",document.getElementById('cc-mask').value );
            formData.append("name",document.getElementById('nameoncard').value);
            formData.append("cvv",document.getElementById('cvv').value);
            formData.append("year",document.getElementById('year').value);
            formData.append("month",document.getElementById('month').value);
            formData.append("type",type);
fetch('${BASE_URL}account-payment-methods',{
method:'post',
    headers:{
        'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
    },
    body:formData
}).then(response=>response.text()).then(text=>alert(text))

        })
    </script>
</layout:put>

</layout:extends>
