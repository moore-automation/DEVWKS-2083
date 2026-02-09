Connect to the lab using the VPNless link for your seat. No VPN client is required — simply click your seat's link below to open the NSO sandbox login page.

## Lab Access (VPNless Links)

<table>
<thead>
<tr>
<th>Seat 1–4</th>
<th>Seat 5–8</th>
<th>Seat 9–12</th>
<th>Seat 13–16</th>
</tr>
</thead>
<tbody>
{% for seat in seats[:4] %}
<tr>
<td><a href="{{ seat.vpnless_url }}" target="_blank" rel="noopener noreferrer" class="lab-link">seat {{ seat.num }} — Open Lab ↗</a></td>
<td>{% if seats[loop.index0 + 4] %}<a href="{{ seats[loop.index0 + 4].vpnless_url }}" target="_blank" rel="noopener noreferrer" class="lab-link">seat {{ seats[loop.index0 + 4].num }} — Open Lab ↗</a>{% endif %}</td>
<td>{% if seats[loop.index0 + 8] %}<a href="{{ seats[loop.index0 + 8].vpnless_url }}" target="_blank" rel="noopener noreferrer" class="lab-link">seat {{ seats[loop.index0 + 8].num }} — Open Lab ↗</a>{% endif %}</td>
<td>{% if seats[loop.index0 + 12] %}<a href="{{ seats[loop.index0 + 12].vpnless_url }}" target="_blank" rel="noopener noreferrer" class="lab-link">seat {{ seats[loop.index0 + 12].num }} — Open Lab ↗</a>{% endif %}</td>
</tr>
{% endfor %}
</tbody>
</table>

<style>
.lab-link {
  color: #0078d4;
  font-weight: 500;
}
td {
  position: relative;
}
</style>
