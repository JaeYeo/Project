/* kakaopay */

const kakaopay = document.getElementById('kakaopay');
const form = document.getElementById('integrationInfoForm');

kakaopay.addEventListener("click", function() {
	form.action = "kakaoPay_ready";
	form.method = "post";
	form.submit();
});

