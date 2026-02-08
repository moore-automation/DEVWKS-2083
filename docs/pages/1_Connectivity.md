Connect to the lab using Cisco Secure Client. Each seat has a dedicated VPN instance — find your credentials in the table below.

The VPN username is provided in the presentation. The VPN password for your seat is listed here.

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
