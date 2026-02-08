Connectivity to the lab will be via Cisco Secure Client to an instance specific to your seat number. You can find the below credentials to connect and an example entry below:

## VPN Connectivity

You can find the credentials to connect to the VPN for your seat below. You will need to use the Cisco Secure Client to connect to the VPN.

The VPN Username is provided in the presentation and the VPN Password is provided in the table below.

## VPN Credentials

<table>
  <thead>
    <tr>
      <th>Pod Name</th>
      <th>VPN Address</th>
      <th>VPN Password</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>seat-1</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20412</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-2</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20394</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-3</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20395</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-4</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20396</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-5</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20397</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-6</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20400</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-7</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20401</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-8</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20403</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-9</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20404</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-10</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20405</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-11</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20406</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-12</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20407</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-13</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20408</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-14</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20409</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-15</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20410</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>seat-16</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20411</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
    <tr>
      <td>speaker-1</td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">devnetsandbox-usw1-reservation.cisco.com:20378</button></td>
      <td><button class="copy-btn" onclick="copyToClipboard(this)">XXXXX</button></td>
    </tr>
  </tbody>
</table>

<script>
function copyToClipboard(btn) {
  const text = btn.textContent;
  navigator.clipboard.writeText(text);
  btn.textContent = "Copied!";
  //setTimeout(() => btn.textContent = btn.getAttribute('data-original'), 1000);
}
// Store original text for each button
/*
window.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.copy-btn').forEach(btn => {
    btn.setAttribute('data-original', btn.textContent);
  });
});*/
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