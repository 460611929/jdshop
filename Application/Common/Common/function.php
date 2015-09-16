<?php

function http($url, $params, $method = 'GET', $header = array(), $multi = false)
{
    $ch = curl_init();
    $opts = array(
        CURLOPT_TIMEOUT => 30,
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_HTTPHEADER => $header
    );
    switch (strtoupper($method)) {
        case 'GET':
            $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
            break;
        case 'POST':
            $params = $multi ? $params : http_build_query($params);
            $opts[CURLOPT_URL] = $url;
            $opts[CURLOPT_POST] = 1;
            $opts[CURLOPT_POSTFIELDS] = $params;
            break;
        default:
            E('��֧�ֵ�����ʽ��');
    }

    curl_setopt_array($ch, $opts);
    $output = curl_exec($ch);
    $error = curl_error($ch);
    curl_close($ch);
    if ($error) exit('����������' . $error);
    return $output;
}
