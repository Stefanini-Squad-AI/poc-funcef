object DtmAtendimento: TDtmAtendimento
  OldCreateOrder = True
  Left = 65528
  Top = 137
  Height = 479
  Width = 741
  object QryInsAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ATEND'
      
        '  (IDATEND,        IDTIPOATEND,     CODATEND,       DATA,      N' +
        'OMESOLICITANTE, TELSOLICITANTE, CODATENDENTE,'
      
        '   RESPOSTA,       STATUS,          OBSERVACAO,     IDTITULAR, I' +
        'DPESSJUR,       DATAINICIO,     LOGRADOURO,'
      
        '   NUMEROSOLIC,    COMPLEMSOLIC,    BAIRROSOLIC,    CEPSOLIC,  C' +
        'IDADESOLIC,     COMPLCODATEND,  IDLOCALATENDXCPU,'
      
        '   PERGUNTA,       IDESTADO,        CODESTADOSOLIC, TIPOSOLIC, D' +
        'DISOLIC,        DDDSOLIC,       NUMEROTELSOLIC,'
      
        '   IDBENEFICIARIO, NUMDOCUMENTOCPF, NUMDOCUMENTORG, EMAIL,     D' +
        'THORACHEGADA,   IDUSUARIO,      CONTATOTEL)'
      'VALUES'
      
        '  (:IDATEND,        :IDTIPOATEND,     :CODATEND,       :DATA,   ' +
        '   :NOMESOLICITANTE, :TELSOLICITANTE, :CODATENDENTE,'
      
        '   :RESPOSTA,       :STATUS,          :OBSERVACAO,     :IDTITULA' +
        'R, :IDPESSJUR,       :DATAINICIO,     :LOGRADOURO,'
      
        '   :NUMEROSOLIC,    :COMPLEMSOLIC,    :BAIRROSOLIC,    :CEPSOLIC' +
        ',  :CIDADESOLIC,     :COMPLCODATEND,  :IDLOCALATENDXCPU,'
      
        '   :PERGUNTA,       :IDESTADO,        :CODESTADOSOLIC, :TIPOSOLI' +
        'C, :DDISOLIC,        :DDDSOLIC,       :NUMEROTELSOLIC,'
      
        '   :IDBENEFICIARIO, :NUMDOCUMENTOCPF, :NUMDOCUMENTORG, :EMAIL,  ' +
        '   :DTHORACHEGADA,   :IDUSUARIO,      :CONTATOTEL)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 28
    Top = 15
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'IDTIPOATEND'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'CODATEND'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMESOLICITANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TELSOLICITANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODATENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RESPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMEROSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLEMSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BAIRROSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CEPSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIDADESOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COMPLCODATEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDLOCALATENDXCPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PERGUNTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODESTADOSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDISOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDDSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROTELSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMDOCUMENTOCPF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMDOCUMENTORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMAIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTHORACHEGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CONTATOTEL'
        ParamType = ptUnknown
      end>
  end
  object QryinsAssunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into ASSUNTOXATEND'
      
        '  (IDASSUNTOXATEND, IDASSUNTO, IDATEND, IDASSUNTOXRESP, IDPROCES' +
        'SO, IDCONTRATOEMPTMO, VLRSOLICITADO, NUMPARCELAS)'
      'values'
      
        '  (:IDASSUNTOXATEND, :IDASSUNTO, :IDATEND, :IDASSUNTOXRESP, :IDP' +
        'ROCESSO, :IDCONTRATOEMPTMO, :VLRSOLICITADO, :NUMPARCELAS)'
      ' ')
    ValidateWithMask = True
    Left = 108
    Top = 7
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDASSUNTOXATEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDASSUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDASSUNTOXRESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'VLRSOLICITADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMPARCELAS'
        ParamType = ptInput
      end>
  end
  object QryUpdAssunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update ASSUNTOXATEND'
      'set'
      '  IDASSUNTO = :IDASSUNTO,'
      '  IDATEND = :IDATEND,'
      '  IDASSUNTOXRESP = :IDASSUNTOXRESP,'
      '  IDPROCESSO = :IDPROCESSO'
      'where'
      '  IDASSUNTOXATEND = :IDASSUNTOXATEND')
    ValidateWithMask = True
    Left = 108
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDASSUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDASSUNTOXRESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDASSUNTOXATEND'
        ParamType = ptUnknown
      end>
  end
  object QryExisteAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDATEND '
      'FROM '
      '  ATEND '
      'WHERE '
      '  IDATEND = :IDATEND')
    ValidateWithMask = True
    Left = 180
    Top = 15
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
      end>
    object QryExisteAtendIDATEND: TFloatField
      FieldName = 'IDATEND'
    end
  end
  object QryUpdAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE ATEND'
      'SET'
      '  IDTIPOATEND           = :IDTIPOATEND,'
      '  CODATEND              = :CODATEND,'
      '  DATA                  = :DATA,'
      '  NOMESOLICITANTE       = :NOMESOLICITANTE,'
      '  TELSOLICITANTE        = :TELSOLICITANTE,'
      '  CODATENDENTE          = :CODATENDENTE,'
      '  RESPOSTA              = :RESPOSTA,'
      '  STATUS                = :STATUS,'
      '  OBSERVACAO            = :OBSERVACAO,'
      '  IDTITULAR             = :IDTITULAR,'
      '  IDPESSJUR             = :IDPESSJUR,'
      '  DATAINICIO            = :DATAINICIO,'
      '  LOGRADOURO            = :LOGRADOURO,'
      '  NUMEROSOLIC           = :NUMEROSOLIC,'
      '  COMPLEMSOLIC          = :COMPLEMSOLIC,'
      '  BAIRROSOLIC           = :BAIRROSOLIC,'
      '  CEPSOLIC              = :CEPSOLIC,'
      '  CIDADESOLIC           = :CIDADESOLIC,'
      '  COMPLCODATEND         = :COMPLCODATEND,'
      '  IDLOCALATENDXCPU      = :IDLOCALATENDXCPU,'
      '  PERGUNTA              = :PERGUNTA,'
      '  IDESTADO              = :IDESTADO,'
      '  CODESTADOSOLIC        = :CODESTADOSOLIC,'
      '  TIPOSOLIC             = :TIPOSOLIC,'
      '  DDISOLIC              = :DDISOLIC,'
      '  DDDSOLIC              = :DDDSOLIC,'
      '  NUMEROTELSOLIC        = :NUMEROTELSOLIC,'
      '  IDBENEFICIARIO        = :IDBENEFICIARIO,'
      '  NUMDOCUMENTOCPF       = :NUMDOCUMENTOCPF,'
      '  NUMDOCUMENTORG        = :NUMDOCUMENTORG,'
      '  EMAIL                 = :EMAIL,'
      '  DTHORACHEGADA         = :DTHORACHEGADA,'
      '  IDUSUARIO             = :IDUSUARIO,'
      '  CONTATOTEL            = :CONTATOTEL'
      'WHERE'
      '  IDATEND               = :IDATEND'
      '')
    ValidateWithMask = True
    Left = 28
    Top = 79
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOATEND'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'CODATEND'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMESOLICITANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TELSOLICITANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODATENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RESPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMEROSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLEMSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BAIRROSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CEPSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIDADESOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COMPLCODATEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDLOCALATENDXCPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PERGUNTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODESTADOSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDISOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDDSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROTELSOLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMDOCUMENTOCPF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMDOCUMENTORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMAIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTHORACHEGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CONTATOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
      end>
  end
end
