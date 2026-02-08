Connectivity to the lab will be via Cisco Secure Client to an instance specific to your seat number. You can find the below credentials to connect and an example entry below:

## VPN Connectivity

You can find the credentials to connect to the VPN for your seat below. You will need to use the Cisco Secure Client to connect to the VPN.

The VPN Username is provided in the presentation and the VPN Password is provided in the table below.

## VPN Credentials

<table>
<thead>
<tr>
<th>Seat</th>
<th>VPN Address</th>
<th>VPN Password</th>
</tr>
</thead>
<tbody>
{% for seat in seats %}
<tr>
<td>seat {{ seat.num }}</td>
<td><button class="copy-btn" onclick="copyToClipboard(this)">{{ seat.vpn_address }}</button></td>
<td><button class="copy-btn" onclick="copyToClipboard(this)">{{ seat.vpn_password }}</button></td>
</tr>
{% endfor %}
</tbody>
</table>

<script>
function copyToClipboard(btn) {
  const text = btn.textContent;
  navigator.clipboard.writeText(text);
  btn.textContent = "Copied!";
}
</script>

<style>
.copy-btn {
  font-size: 0.95em;
  margin-left: 0;
  cursor: pointer;
  background: none;
  border: none;
  color: #0078d4;
  text-decoration: underline;
  padding: 0;
}
td {
  position: relative;
}
</style>
