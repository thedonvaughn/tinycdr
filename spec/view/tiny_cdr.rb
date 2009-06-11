require File.expand_path('../../db_helper', __FILE__)
require TinyCDR::SPEC_HELPER_PATH/:directory_data

SAMPLE_XML = %q{<?xml version="1.0"?>
<cdr>
  <variables>
    <sip_received_ip>192.168.6.32</sip_received_ip>
    <sip_received_port>5061</sip_received_port>
    <sip_via_protocol>udp</sip_via_protocol>
    <sip_authorized>true</sip_authorized>
    <sip_number_alias>1000</sip_number_alias>
    <sip_auth_username>1000</sip_auth_username>
    <sip_auth_realm>192.168.6.32</sip_auth_realm>
    <number_alias>1000</number_alias>
    <toll_allow>domestic,international,local</toll_allow>
    <accountcode>1000</accountcode>
    <user_context>default</user_context>
    <effective_caller_id_name>Extension%201000</effective_caller_id_name>
    <effective_caller_id_number>1000</effective_caller_id_number>
    <outbound_caller_id_name>FreeSWITCH</outbound_caller_id_name>
    <outbound_caller_id_number>0000000000</outbound_caller_id_number>
    <callgroup>techsupport</callgroup>
    <sip_from_user>1000</sip_from_user>
    <sip_from_uri>1000%40192.168.6.32</sip_from_uri>
    <sip_from_host>192.168.6.32</sip_from_host>
    <sip_from_user_stripped>1000</sip_from_user_stripped>
    <sip_from_tag>mscmt</sip_from_tag>
    <sofia_profile_name>internal</sofia_profile_name>
    <sip_req_user>2622</sip_req_user>
    <sip_req_uri>2622%40192.168.6.32</sip_req_uri>
    <sip_req_host>192.168.6.32</sip_req_host>
    <sip_to_user>2622</sip_to_user>
    <sip_to_uri>2622%40192.168.6.32</sip_to_uri>
    <sip_to_host>192.168.6.32</sip_to_host>
    <sip_contact_user>1000</sip_contact_user>
    <sip_contact_port>5061</sip_contact_port>
    <sip_contact_uri>1000%40192.168.6.32%3A5061</sip_contact_uri>
    <sip_contact_host>192.168.6.32</sip_contact_host>
    <channel_name>sofia/internal/1000%40192.168.6.32</channel_name>
    <sip_call_id>uezqmckgyeznkvl%40onedrop.nationwide-recovery.com</sip_call_id>
    <sip_user_agent>Twinkle/1.2</sip_user_agent>
    <sip_via_host>192.168.6.32</sip_via_host>
    <sip_via_port>5061</sip_via_port>
    <sip_via_rport>5061</sip_via_rport>
    <max_forwards>70</max_forwards>
    <presence_id>1000%40192.168.6.32</presence_id>
    <switch_r_sdp>v%3D0%0D%0Ao%3Dtwinkle%20762635683%20846376332%20IN%20IP4%20192.168.6.32%0D%0As%3D-%0D%0Ac%3DIN%20IP4%20192.168.6.32%0D%0At%3D0%200%0D%0Am%3Daudio%208000%20RTP/AVP%2098%2097%208%200%203%20101%0D%0Aa%3Drtpmap%3A98%20speex/16000%0D%0Aa%3Drtpmap%3A97%20speex/8000%0D%0Aa%3Drtpmap%3A8%20PCMA/8000%0D%0Aa%3Drtpmap%3A0%20PCMU/8000%0D%0Aa%3Drtpmap%3A3%20GSM/8000%0D%0Aa%3Drtpmap%3A101%20telephone-event/8000%0D%0Aa%3Dfmtp%3A101%200-15%0D%0Aa%3Dptime%3A20%0D%0A</switch_r_sdp>
    <remote_media_ip>192.168.6.32</remote_media_ip>
    <remote_media_port>8000</remote_media_port>
    <read_codec>PCMA</read_codec>
    <read_rate>8000</read_rate>
    <write_codec>PCMA</write_codec>
    <write_rate>8000</write_rate>
    <open>true</open>
    <use_profile>nat</use_profile>
    <record_stereo>true</record_stereo>
    <transfer_fallback_extension>operator</transfer_fallback_extension>
    <numbering_plan>US</numbering_plan>
    <default_areacode>918</default_areacode>
    <default_gateway>example.com</default_gateway>
    <user_name>default</user_name>
    <domain_name>192.168.6.32</domain_name>
    <dialed_extension>2622</dialed_extension>
    <hangup_after_bridge>true</hangup_after_bridge>
    <continue_on_fail>true</continue_on_fail>
    <originate_timeout>30</originate_timeout>
    <new_call_direction>out</new_call_direction>
    <current_application_data>sofia/gateway/carlos/2622</current_application_data>
    <current_application>bridge</current_application>
    <switch_m_sdp>v%3D0%0D%0Ao%3Droot%20467%20467%20IN%20IP4%20192.168.6.244%0D%0As%3Dsession%0D%0Ac%3DIN%20IP4%20192.168.6.244%0D%0At%3D0%200%0D%0Am%3Daudio%2016994%20RTP/AVP%200%208%20101%0D%0Aa%3Drtpmap%3A0%20PCMU/8000%0D%0Aa%3Drtpmap%3A8%20PCMA/8000%0D%0Aa%3Drtpmap%3A101%20telephone-event/8000%0D%0Aa%3Dfmtp%3A101%200-16%0D%0Aa%3DsilenceSupp%3Aoff%20-%20-%20-%20-%0D%0Aa%3Dptime%3A20%0D%0A</switch_m_sdp>
    <local_media_ip>192.168.6.32</local_media_ip>
    <local_media_port>16936</local_media_port>
    <endpoint_disposition>EARLY%20MEDIA</endpoint_disposition>
    <sip_nat_detected>true</sip_nat_detected>
    <originate_disposition>SUCCESS</originate_disposition>
    <bridge_channel>sofia/internal/2622</bridge_channel>
    <bridge_uuid>913d2a1c-461f-11de-aa7f-b10b4edc0c92</bridge_uuid>
    <signal_bond>913d2a1c-461f-11de-aa7f-b10b4edc0c92</signal_bond>
    <sip_term_status>487</sip_term_status>
    <proto_specific_hangup_cause>sip%3A487</proto_specific_hangup_cause>
    <sip_term_cause>487</sip_term_cause>
    <bridge_hangup_cause>NORMAL_CLEARING</bridge_hangup_cause>
    <hangup_cause>ORIGINATOR_CANCEL</hangup_cause>
    <hangup_cause_q850>16</hangup_cause_q850>
    <digits_dialed>none</digits_dialed>
    <start_stamp>2009-05-21%2010%3A53%3A46</start_stamp>
    <profile_start_stamp>2009-05-21%2010%3A53%3A46</profile_start_stamp>
    <progress_stamp>2009-05-21%2010%3A53%3A46</progress_stamp>
    <progress_media_stamp>2009-05-21%2010%3A53%3A46</progress_media_stamp>
    <end_stamp>2009-05-21%2010%3A53%3A47</end_stamp>
    <start_epoch>1242921226</start_epoch>
    <start_uepoch>1242921226180441</start_uepoch>
    <profile_start_epoch>1242921226</profile_start_epoch>
    <profile_start_uepoch>1242921226180441</profile_start_uepoch>
    <answer_epoch>0</answer_epoch>
    <answer_uepoch>0</answer_uepoch>
    <progress_epoch>1242921226</progress_epoch>
    <progress_uepoch>1242921226580377</progress_uepoch>
    <progress_media_epoch>1242921226</progress_media_epoch>
    <progress_media_uepoch>1242921226281214</progress_media_uepoch>
    <end_epoch>1242921227</end_epoch>
    <end_uepoch>1242921227691068</end_uepoch>
    <last_app>bridge</last_app>
    <last_arg>sofia/gateway/carlos/2622</last_arg>
    <caller_id>%22Jayson%20Vaughn%22%20%3C1000%3E</caller_id>
    <duration>1</duration>
    <billsec>0</billsec>
    <progresssec>0</progresssec>
    <progress_mediasec>0</progress_mediasec>
    <flow_billsec>0</flow_billsec>
    <mduration>1511</mduration>
    <billmsec>0</billmsec>
    <progressmsec>400</progressmsec>
    <progress_mediamsec>400</progress_mediamsec>
    <flow_billmsec>0</flow_billmsec>
    <uduration>1510627</uduration>
    <billusec>0</billusec>
    <progressusec>399936</progressusec>
    <progress_mediausec>100773</progress_mediausec>
    <flow_billusec>0</flow_billusec>
    <rtp_audio_in_raw_bytes>9808</rtp_audio_in_raw_bytes>
    <rtp_audio_in_media_bytes>9808</rtp_audio_in_media_bytes>
    <rtp_audio_in_packet_count>58</rtp_audio_in_packet_count>
    <rtp_audio_in_media_packet_count>58</rtp_audio_in_media_packet_count>
    <rtp_audio_in_skip_packet_count>15</rtp_audio_in_skip_packet_count>
    <rtp_audio_in_jb_packet_count>0</rtp_audio_in_jb_packet_count>
    <rtp_audio_in_dtmf_packet_count>0</rtp_audio_in_dtmf_packet_count>
    <rtp_audio_in_cng_packet_count>0</rtp_audio_in_cng_packet_count>
    <rtp_audio_in_flush_packet_count>0</rtp_audio_in_flush_packet_count>
    <rtp_audio_out_raw_bytes>11696</rtp_audio_out_raw_bytes>
    <rtp_audio_out_media_bytes>11696</rtp_audio_out_media_bytes>
    <rtp_audio_out_packet_count>68</rtp_audio_out_packet_count>
    <rtp_audio_out_media_packet_count>68</rtp_audio_out_media_packet_count>
    <rtp_audio_out_skip_packet_count>0</rtp_audio_out_skip_packet_count>
    <rtp_audio_out_dtmf_packet_count>0</rtp_audio_out_dtmf_packet_count>
    <rtp_audio_out_cng_packet_count>0</rtp_audio_out_cng_packet_count>
  </variables>
  <app_log>
    <application app_name="set" app_data="open=true"></application>
    <application app_name="set" app_data="use_profile=nat"></application>
    <application app_name="set_user" app_data="default@192.168.6.32"></application>
    <application app_name="hash" app_data="insert/192.168.6.32-spymap/1000/91353230-461f-11de-aa7f-b10b4edc0c92"></application>
    <application app_name="hash" app_data="insert/192.168.6.32-last_dial/1000/2622"></application>
    <application app_name="hash" app_data="insert/192.168.6.32-last_dial/global/91353230-461f-11de-aa7f-b10b4edc0c92"></application>
    <application app_name="set" app_data="dialed_extension=2622"></application>
    <application app_name="set" app_data="hangup_after_bridge=true"></application>
    <application app_name="set" app_data="continue_on_fail=true"></application>
    <application app_name="set" app_data="originate_timeout=30"></application>
    <application app_name="set" app_data="new_call_direction=out"></application>
    <application app_name="bridge" app_data="sofia/gateway/carlos/2622"></application>
  </app_log>
  <callflow dialplan="XML" profile_index="1">
    <extension name="tod_example" number="2622" current_app="hangup">
      <application app_name="set" app_data="open=true"></application>
      <application app_name="set" app_data="use_profile=${cond(${acl(${network_addr} rfc1918)} == true ? nat : default)}"></application>
      <application app_name="set_user" app_data="default@${domain_name}"></application>
      <application app_name="hash" app_data="insert/${domain_name}-spymap/${caller_id_number}/${uuid}"></application>
      <application app_name="hash" app_data="insert/${domain_name}-last_dial/${caller_id_number}/${destination_number}"></application>
      <application app_name="hash" app_data="insert/${domain_name}-last_dial/global/${uuid}"></application>
      <application app_name="set" app_data="dialed_extension=2622"></application>
      <application app_name="set" app_data="hangup_after_bridge=true"></application>
      <application app_name="set" app_data="continue_on_fail=true"></application>
      <application app_name="set" app_data="originate_timeout=30"></application>
      <application app_name="set" app_data="new_call_direction=out"></application>
      <application app_name="bridge" app_data="sofia/gateway/carlos/${dialed_extension}"></application>
      <application last_executed="true" app_name="hangup" app_data=""></application>
    </extension>
    <caller_profile>
      <username>1000</username>
      <dialplan>XML</dialplan>
      <caller_id_name>Jayson Vaughn</caller_id_name>
      <ani></ani>
      <aniii></aniii>
      <caller_id_number>1000</caller_id_number>
      <network_addr>192.168.6.32</network_addr>
      <rdnis></rdnis>
      <destination_number>2622</destination_number>
      <uuid>91353230-461f-11de-aa7f-b10b4edc0c92</uuid>
      <source>mod_sofia</source>
      <context>default</context>
      <chan_name>sofia/internal/1000@192.168.6.32</chan_name>
      <originatee>
        <originatee_caller_profile>
          <username>1000</username>
          <dialplan>XML</dialplan>
          <caller_id_name>Extension 1000</caller_id_name>
          <ani></ani>
          <aniii></aniii>
          <caller_id_number>1000</caller_id_number>
          <network_addr>192.168.6.32</network_addr>
          <rdnis></rdnis>
          <destination_number>2622</destination_number>
          <uuid>913d2a1c-461f-11de-aa7f-b10b4edc0c92</uuid>
          <source>mod_sofia</source>
          <context>default</context>
          <chan_name>sofia/internal/2622</chan_name>
        </originatee_caller_profile>
      </originatee>
    </caller_profile>
    <times>
      <created_time>1242921226180441</created_time>
      <profile_created_time>1242921226180441</profile_created_time>
      <progress_time>1242921226580377</progress_time>
      <progress_media_time>1242921226281214</progress_media_time>
      <answered_time>0</answered_time>
      <hangup_time>1242921227691068</hangup_time>
      <transfer_time>0</transfer_time>
    </times>
  </callflow>
</cdr>
}

describe TinyCDR do
  
  def tinycdr_factory
    TinyCDR::ScrubXML.new(SAMPLE_XML)
  end

  should 'be able to read an XML document' do
    xml_doc = tinycdr_factory
    xml_doc.class.should.equal TinyCDR::ScrubXML
  end

  should 'be able to request CDR info from XML' do
    xml_doc = tinycdr_factory
    xml_doc.request_cdr_info
    xml_doc.username.should.equal "1000"
  end

end

