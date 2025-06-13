package com.qqxue.qqx.check_proxy

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import java.net.InetSocketAddress
import java.net.ProxySelector
import java.net.URI

class SystemUtil {
  companion object {
    fun isVPNActive(context: Context): Boolean {
      val connectivityManager =
        context.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
      val networks: Array<Network>? = connectivityManager?.allNetworks

      for (network in networks ?: emptyArray()) {
        val caps = connectivityManager?.getNetworkCapabilities(network)
        if (caps != null && caps.hasTransport(NetworkCapabilities.TRANSPORT_VPN)) {
          return true
        }
      }
      return false
    }

    fun isManualProxySet(uri: String): Boolean {
      val proxies = ProxySelector.getDefault().select(URI(uri))
      val result = proxies.any { proxy ->
        proxy.address() is InetSocketAddress
      }
      return result
    }
  }
}