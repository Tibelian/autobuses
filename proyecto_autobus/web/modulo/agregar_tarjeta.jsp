
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="card-wrapper"></div>
<form method="post" action="./agregarTarjeta">
    <input type="hidden" name="tipo" id="tipo">
    <div class="form-group col px-0">
        <div class="input-group">
            <label class="input-group-prepend mb-0" for="numero"><span class="input-group-text"><i class="fas fa-credit-card"></i></span></label>
            <input placeholder="Número tarjeta" onkeyup="actualizaTipoTarjeta('tipo')" name="numero" id="numero" class="form-control" type="text">
            <label class="input-group-prepend mb-0" for="nombre"><span class="input-group-text"><i class="fas fa-user"></i></span></label>
            <input placeholder="Nombre titular" name="nombre" id="nombre" class="form-control" type="text">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <label class="input-group-prepend mb-0" for="caducidad"><span class="input-group-text"><i class="fas fa-calendar"></i></span></label>
            <input placeholder="Fecha caducidad" name="caducidad" id="caducidad" class="form-control" type="month" min="today">
            <label class="input-group-prepend mb-0" for="cvv"><span class="input-group-text"><i class="fas fa-lock"></i></span></label>
            <input placeholder="CVV" name="cvv" id="cvv" class="form-control" type="number" size="3">
        </div>
    </div>
    <button class="w-100 btn btn-primary" type="submit">Guardar</button>
</form>

<script>
    var card;
    function actualizaTipoTarjeta(inputTipo){
        var tipo = document.getElementById(inputTipo);
        tipo.value = card.cardType;
        console.log(card.cardType);
    }
    window.onload = function(){ 
        card = new Card({
            form: 'form', // *required*
            container: '.card-wrapper', // *required*
            formSelectors: {
                numberInput: 'input#numero', // optional — default input[name="number"]
                expiryInput: 'input#caducidad', // optional — default input[name="expiry"]
                cvcInput: 'input#cvv', // optional — default input[name="cvc"]
                nameInput: 'input#nombre' // optional - defaults input[name="name"]
            },
            width: 300,
            messages: {
                validDate: 'valid\ndate', // optional - default 'valid\nthru'
                monthYear: 'mm/yyyy' // optional - default 'month/year'
            },
            placeholders: {
                number: '•••• •••• •••• ••••',
                name: 'NOMBRE TITULAR',
                expiry: '••/••',
                cvc: '•••'
            },
            masks: {
                cardNumber: '•' // optional - mask card number
            },
            debug: false // optional - default false
        });
    };
</script>