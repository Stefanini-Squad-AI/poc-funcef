object DtmconsPart1: TDtmconsPart1
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qryContatos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  EP.NOME AS ENDRECO,'
      '  CT.NOME,'
      '  CT.EMAIL,'
      '  TEL.DDI,'
      '  TEL.DDD,'
      '  TEL.NUMERO AS TELEFONE,'
      '  CT.CARGO,'
      '  CT.SETOR,'
      '  CT.NASCIMENTO,'
      '  CT.OBS'
      'FROM ENDPESS EP, CONTATOPESS CT, TELENDPESS TEL'
      'WHERE EP.IDPESSOA = :IDPESSOA       AND'
      '      CT.IDENDERECO = EP.IDENDERECO AND'
      '      TEL.IDENDERECO = EP.IDENDERECO(+)')
    ValidateWithMask = True
    Left = 9
    Top = 10
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryContatosENDRECO: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 30
      FieldName = 'ENDRECO'
      Size = 40
    end
    object qryContatosNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 50
    end
    object qryContatosEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      DisplayWidth = 30
      FieldName = 'EMAIL'
      Size = 40
    end
    object qryContatosDDI: TStringField
      DisplayWidth = 4
      FieldName = 'DDI'
      FixedChar = True
      Size = 4
    end
    object qryContatosDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object qryContatosTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 20
      FieldName = 'TELEFONE'
    end
    object qryContatosCARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 15
      FieldName = 'CARGO'
      Size = 30
    end
    object qryContatosSETOR: TStringField
      DisplayLabel = 'Setor'
      DisplayWidth = 15
      FieldName = 'SETOR'
      Size = 30
    end
    object qryContatosNASCIMENTO: TDateTimeField
      DisplayLabel = 'Dt. Nascimento'
      DisplayWidth = 18
      FieldName = 'NASCIMENTO'
    end
    object qryContatosOBS: TMemoField
      DisplayWidth = 10
      FieldName = 'OBS'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
  end
  object DsContatos: TwwDataSource
    DataSet = qryContatos
    Left = 11
    Top = 10
  end
  object qryBeneficios: TwwQuery
    AfterScroll = qryBeneficiosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       BF.IDPESSJUR,'
      '       BF.IDPLANOPREV,'
      ''
      '       S.DESCRICAO, B.NOME, BF.VALORATUAL, BV.NOMEVALORBASE1,'
      '       BV.NOMEVALORBASE2, BF.VALORTOTAL,'
      '       BV.NOMEVALORBASE3,  BF.DATAINICIO, BF.DATAFINAL,'
      ''
      
        '      DECODE(BF.VALORBASE1,NULL,BP.VALORBASE1, BF.VALORBASE1) VA' +
        'LORBASE1,'
      
        '      DECODE(BF.VALORBASE2,NULL,BP.VALORBASE2, BF.VALORBASE2) VA' +
        'LORBASE2,'
      
        '      DECODE(BF.VALORBASE3,NULL,BP.VALORBASE3, BF.VALORBASE3) VA' +
        'LORBASE3,'
      ''
      '       BF.DATAFINALPREVISTA,'
      
        '       BF.ULTMESPREPARO, BF.ULTMESREAJUSTE, BFT.IDPESSOA, BFT.ID' +
        'RESPONSAVEL,'
      
        '       PBEN.NOME AS NOMEBEN, PRESP.NOME AS NOMERESP, BF.NUMEROPR' +
        'OCESSO,'
      
        '       BF.NUMPROCINSS, PFBEN.DATANASC, DECODE(DP.IDSITDEPENDENTE' +
        ',NULL,'#39#39','
      
        '       SD.DESCRICAO) AS DESCDEPEN, BF.DATAINICIOINSS, BF.DATAULT' +
        'REAJUSTE,'
      '       DECODE(BF.FLGBENEFMIN,1,'#39'SIM'#39','#39'NÃO'#39') AS BENEFMIN,'
      '       BF.VALORSRB, DPN.DESCRICAO AS DEPENDENCIA ,'
      
        '       BFT.PERCENTUAL, DATAEMISSAORECAD, DATALIMITERECAD, DATARE' +
        'CEBRECAD,'
      ''
      '       DECODE(M.MOTRETENC, '#39'1'#39', '#39'COMPLETOU MAIOR IDADE'#39','
      '                           '#39'2'#39', '#39'FALTA DE RECADASTRAMENTO'#39','
      '                           '#39'3'#39', '#39'MUDANÇA DE ESTADO CIVIL'#39','
      '                           '#39'4'#39', '#39'CANCELAMENTO PELO INSS'#39','
      '                           '#39'5'#39', '#39'CONCLUSÃO DE CURSO SUPERIOR'#39','
      '                           '#39'6'#39', '#39'FALECIMENTO'#39','
      '                           '#39'7'#39', '#39'OUTROS'#39','
      '                           '#39'8'#39', '#39'QUITACAO AUTOMATICA TOTALPREV'#39','
      '                           '#39'9'#39', '#39'SEM DEPENDENTE VÁLIDO (INSS)'#39','
      '                          '#39'10'#39', '#39'BENEFICIÁRIO SEM CPF (INSS)'#39','
      '                          '#39'11'#39', '#39'MUDANÇA PARA FORA DO CONVÊNIO'#39
      '                           ) AS MOTIVO,'
      '       M.VALORATUALANT,'
      '       M.VALORATUAL'
      'FROM'
      '  BENEFBFCIARIO BF,'
      '  BFCIARIOTITPLAN BFT,'
      '  PESSOA PBEN,'
      '  PESSOA PRESP,'
      '  PESSOAFISICA PFBEN,'
      '  DEPENDENTE DP,'
      '  DEPENTIT DT,'
      '  BENEFPLANOPART BP,'
      '  BENEFPLANPREV BV,'
      '  BENEFICIO B,'
      '  SITBENEFICIO S,'
      '  SITDEPENDENTE SD,'
      '  DEPEN DPN,'
      '  MOVBENEF M'
      'WHERE'
      '/* BF.IDPESSJUR        = IDPESSJUR'
      'AND   BF.IDPLANOORIGEM      = IDPLANOPREV'
      'AND */'
      '           BF.IDTITULAR               = :IDTITULAR'
      'AND   BF.IDPESSOA                = :IDPESSOA'
      'AND   BF.SEQPROPOSTA '#9'  = :SEQPROPOSTA '
      'AND   BF.IDPESSJUR   '#9'  = BFT.IDPESSJUR'
      'AND   BF.IDPLANOORIGEM '#9'  = BFT.IDPLANOORIGEM'
      'AND   BF.IDPLANOPREV '#9'  = BFT.IDPLANOPREV'
      'AND   BF.IDTITULAR   '#9'  = BFT.IDTITULAR'
      'AND   BF.IDPESSOA    '#9'  = BFT.IDPESSOA'
      'AND   BF.IDBENEFICIO            = BFT.IDBENEFICIO'
      'AND   BF.SEQPROPOSTA '#9'  = BFT.SEQPROPOSTA'
      'AND   BFT.IDPESSOA   '#9'  = PBEN.IDPESSOA'
      'AND   BFT.IDRESPONSAVEL  = PRESP.IDPESSOA'
      'AND   BFT.IDPESSOA              = PFBEN.IDPESSOA'
      'AND   BFT.IDPESSOA              = DP.IDPESSOA(+)'
      'AND   BF.IDPESSJUR              = BP.IDPESSJUR(+)'
      'AND   BF.IDPLANOPREV  '#9'  = BP.IDPLANOPREV(+)'
      'AND   BF.IDTITULAR               = BP.IDPESSOA(+)'
      'AND   BF.IDBENEFICIO '#9'  = BP.IDBENEFICIO(+)'
      'AND   BF.SEQPROPOSTA '#9'  = BP.SEQPROPOSTA(+)'
      ''
      'AND   BF.IDBENEFICIO '#9'  = BV.IDBENEFICIO(+)'
      'AND   BF.IDPLANOPREV '#9'  = BV.IDPLANOPREV(+)'
      'AND   BV.IDBENEFICIO '#9'  = B.IDBENEFICIO'
      ''
      'AND   BF.IDSITBENEFICIO         = S.IDSITBENEFICIO(+)'
      'AND   DP.IDSITDEPENDENTE  = SD.IDSITDEPENDENTE(+)'
      'AND   DT.IDTITULAR                 = BF.IDTITULAR'
      'AND   DT.IDPESSOA                  = BF.IDPESSOA'
      'AND   DPN.IDDEPENDENCIA    = DT.IDDEPENDENCIA'
      ''
      'AND M.IDTITULAR(+)       = BF.IDTITULAR'
      'AND M.NUMEROPROCESSO (+) = BF.NUMEROPROCESSO'
      'AND M.IDPESSJUR(+)       = BF.IDPESSJUR'
      'AND M.IDPLANOPREV(+)     = BF.IDPLANOPREV'
      'AND M.IDTITULAR(+)       = BF.IDTITULAR'
      'AND M.IDPESSOA(+)        = BF.IDPESSOA'
      'AND M.IDBENEFICIO(+)     = BF.IDBENEFICIO'
      'AND M.NUMEROPROCESSO(+)  = BF.NUMEROPROCESSO'
      'AND M.TIPOMOV(+)         = 4'
      'AND ( ( M.DATAMOV = ( SELECT MAX( X.DATAMOV )'
      '                  FROM   MOVBENEF X'
      '                  WHERE  X.IDTITULAR      = M.IDTITULAR'
      '                    AND  X.NUMEROPROCESSO = M.NUMEROPROCESSO'
      '                    AND  X.IDPESSJUR      = M.IDPESSJUR'
      '                    AND  X.IDPLANOPREV    = M.IDPLANOPREV'
      '                    AND  X.IDTITULAR      = M.IDTITULAR'
      '                    AND  X.IDPESSOA       = M.IDPESSOA'
      '                    AND  X.IDBENEFICIO    = M.IDBENEFICIO'
      '                    AND  X.NUMEROPROCESSO = M.NUMEROPROCESSO'
      
        '                    AND  X.TIPOMOV        = 4 ) ) OR ( M.DATAMOV' +
        ' IS NULL ) )'
      'ORDER BY PBEN.NOME ASC, BF.DATAINICIO DESC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'VALORATUAL'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 92
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
        Value = 8
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
    object qryBeneficiosNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 43
      FieldName = 'NOME'
      Size = 60
    end
    object qryBeneficiosDESCRICAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryBeneficiosVALORATUAL: TFloatField
      DisplayLabel = 'Valor Atual'
      DisplayWidth = 15
      FieldName = 'VALORATUAL'
    end
    object qryBeneficiosVALORATUAL_1: TFloatField
      DisplayLabel = 'Valor Autal ~Mov.'
      DisplayWidth = 10
      FieldName = 'VALORATUAL_1'
    end
    object qryBeneficiosVALORATUALANT: TFloatField
      DisplayLabel = 'Valor Autal ~Mov. Ant.'
      DisplayWidth = 10
      FieldName = 'VALORATUALANT'
    end
    object qryBeneficiosDATAINICIO: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 11
      FieldName = 'DATAINICIO'
    end
    object qryBeneficiosDATAFINAL: TDateTimeField
      DisplayLabel = 'Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryBeneficiosVALORSRB: TFloatField
      DisplayLabel = 'SRB'
      DisplayWidth = 12
      FieldName = 'VALORSRB'
    end
    object qryBeneficiosDATAFINALPREVISTA: TDateTimeField
      DisplayLabel = 'Final Prevista'
      DisplayWidth = 11
      FieldName = 'DATAFINALPREVISTA'
    end
    object qryBeneficiosVALORTOTAL: TFloatField
      DisplayLabel = 'Valor total'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
    end
    object qryBeneficiosULTMESPREPARO: TStringField
      DisplayLabel = 'Preparado até'
      DisplayWidth = 11
      FieldName = 'ULTMESPREPARO'
      FixedChar = True
      Size = 7
    end
    object qryBeneficiosULTMESREAJUSTE: TStringField
      DisplayLabel = 'Reajustado até'
      DisplayWidth = 12
      FieldName = 'ULTMESREAJUSTE'
      FixedChar = True
      Size = 7
    end
    object qryBeneficiosNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Processo CM'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
    end
    object qryBeneficiosNUMPROCINSS: TStringField
      DisplayLabel = 'Processo INSS'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryBeneficiosDATAINICIOINSS: TDateTimeField
      DisplayLabel = 'Início INSS'
      DisplayWidth = 18
      FieldName = 'DATAINICIOINSS'
    end
    object qryBeneficiosNOMEVALORBASE1: TStringField
      DisplayLabel = 'Opção1'
      DisplayWidth = 20
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qryBeneficiosVALORBASE1: TFloatField
      DisplayLabel = 'ValorOp1'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
    end
    object qryBeneficiosNOMEVALORBASE2: TStringField
      DisplayLabel = 'Opção2'
      DisplayWidth = 20
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qryBeneficiosVALORBASE2: TFloatField
      DisplayLabel = 'ValorOp2'
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
    end
    object qryBeneficiosNOMEVALORBASE3: TStringField
      DisplayLabel = 'Opção3'
      DisplayWidth = 20
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
    object qryBeneficiosVALORBASE3: TFloatField
      DisplayLabel = 'ValorOp3'
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
    end
    object qryBeneficiosBENEFMIN: TStringField
      DisplayLabel = 'Benef. Mín.'
      DisplayWidth = 9
      FieldName = 'BENEFMIN'
      Size = 3
    end
    object qryBeneficiosPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
    end
    object qryBeneficiosMOTIVO: TStringField
      DisplayLabel = 'Motivo de Retenção'
      DisplayWidth = 43
      FieldName = 'MOTIVO'
      Size = 43
    end
    object qryBeneficiosDATAEMISSAORECAD: TDateTimeField
      DisplayLabel = 'Data de Emissão ~do Recadastramento'
      DisplayWidth = 18
      FieldName = 'DATAEMISSAORECAD'
    end
    object qryBeneficiosDATALIMITERECAD: TDateTimeField
      DisplayLabel = 'Data Limite ~de Recadastramento'
      DisplayWidth = 18
      FieldName = 'DATALIMITERECAD'
    end
    object qryBeneficiosDATARECEBRECAD: TDateTimeField
      DisplayLabel = 'Data de Recebimento~do Recadastramento'
      DisplayWidth = 18
      FieldName = 'DATARECEBRECAD'
    end
    object qryBeneficiosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryBeneficiosIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
    object qryBeneficiosNOMEBEN: TStringField
      FieldName = 'NOMEBEN'
      Visible = False
      Size = 60
    end
    object qryBeneficiosNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Visible = False
      Size = 60
    end
    object qryBeneficiosDATANASC: TDateTimeField
      FieldName = 'DATANASC'
      Visible = False
    end
    object qryBeneficiosDESCDEPEN: TStringField
      FieldName = 'DESCDEPEN'
      Visible = False
      Size = 50
    end
    object qryBeneficiosDATAULTREAJUSTE: TDateTimeField
      FieldName = 'DATAULTREAJUSTE'
      Visible = False
    end
    object qryBeneficiosDEPENDENCIA: TStringField
      FieldName = 'DEPENDENCIA'
      Visible = False
      Size = 15
    end
    object qryBeneficiosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryBeneficiosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
  object DsBeneficios: TwwDataSource
    AutoEdit = False
    DataSet = qryBeneficios
    Left = 78
    Top = 10
  end
  object dsContaCorrente: TwwDataSource
    DataSet = qryContaCorrente
    Left = 147
    Top = 11
  end
  object qryContaCorrente: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      C.CONTACORRENTE,'
      '      C.IDAGENCIA,'
      '      C.FLGCONTAPREF,'
      '      C.TIPOCONTA,'
      
        '      decode(C.FLGCONTACONJUNTA, '#39'S'#39', '#39'SIM'#39', '#39'NÃO'#39') AS FLGCONTAC' +
        'ONJUNTA,'
      '      PA.NOME AS NOMEAGENCIA,'
      '      PB.NOME AS NOMEBANCO,'
      '      A.NUMAGENCIA,'
      '      A.IDBANCO,'
      '      B.NUMBANCO,'
      '      DECODE(C.FLGCONTAPREF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS CONTAPREF,'
      
        '      DECODE(C.TIPOCONTA, 1, '#39'CORRENTE'#39',  2, '#39'SALÁRIO'#39', 3, '#39'POUP' +
        'ANÇA'#39') AS TPCONTA'
      'FROM'
      '      CONTABANCARIA C,'
      '      PESSOA PA,'
      '      PESSOA PB,'
      '      AGENCIABANCARIA A,'
      '      BANCO B'
      'WHERE C.IDPESSOA  = :IDPESSOA'
      'AND   C.IDAGENCIA = PA.IDPESSOA'
      'AND   C.IDAGENCIA = A.IDPESSOA'
      'AND   A.IDBANCO   = PB.IDPESSOA'
      'AND   A.IDBANCO   = B.IDPESSOA'
      ''
      '')
    ValidateWithMask = True
    Left = 149
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1215012
      end>
  end
  object qrycontrib: TwwQuery
    Tag = 1
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       AA.IDPLANOPREV,'
      '       AA.IDPESSJUR,'
      '       AA.MES ,'
      '       PV.NOME PLANPREV ,'
      '       PL.NOME PLANASS ,'
      '       CONT.NOME CONTRIB,'
      '       AA.VALORESPERADO ,'
      '       AA.VALORRECEBIDO ,'
      '       AA.DATA ,'
      '       AA.MESCOBRANCA ,'
      '       CC.NOME,'
      '       MT.DESCRICAO'
      'FROM   PARTASS PT,'
      '       HSTCONTRIBASS AA,'
      '       PESSOA CC,'
      '       PLANASS PL,'
      '       PLANPREV PV ,'
      '       CONTRIBUICAO CONT,'
      '       MOTIVO MT'
      'WHERE (PT.IDPESSJUR = :IDPESSJUR)'
      'AND   (PT.IDPLANOPREV = :IDPLANOPREV)'
      'AND   (PT.IDPESSOA = :IDTITULAR)'
      'AND   (PT.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (PT.IDPLANASS = AA.IDPLANASS(+))'
      'AND   (PT.IDPLANOPREV = AA.IDPLANOPREV(+))'
      'AND   (PT.IDPESSJUR = AA.IDPESSJUR(+))'
      'AND   (PT.IDPESSOA = AA.IDTITULAR(+))'
      'AND   (CC.IDPESSOA = PT.IDPESSOA)'
      'AND   (PL.IDPLANASS = PT.IDPLANASS)'
      'AND   (PV.IDPLANOPREV = PT.IDPLANOPREV)'
      'AND   (CONT.IDCONTRIBUICAO = AA.IDCONTASS)'
      'AND   (MT.IDMOTIVO  = AA.IDMOTIVO)'
      'ORDER BY AA.MES DESC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 213
    Top = 11
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qrycontribMES: TStringField
      DisplayLabel = 'Mês de Referência'
      DisplayWidth = 7
      FieldName = 'MES'
      Origin = '"CM.HSTCONTRIBASS".MES'
      Size = 7
    end
    object qrycontribPLANPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 25
      FieldName = 'PLANPREV'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object qrycontribPLANASS: TStringField
      DisplayLabel = 'Plano Assistencial'
      DisplayWidth = 25
      FieldName = 'PLANASS'
      Origin = '"CM.PLANASS".NOME'
      Size = 40
    end
    object qrycontribCONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 25
      FieldName = 'CONTRIB'
      Origin = '"CM.CONTRIBUICAO".NOME'
      Size = 60
    end
    object qrycontribVALORESPERADO: TFloatField
      DisplayLabel = 'Valor Esperado'
      DisplayWidth = 10
      FieldName = 'VALORESPERADO'
      Origin = '"CM.HSTCONTRIBASS".VALORESPERADO'
    end
    object qrycontribVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      Origin = '"CM.HSTCONTRIBASS".VALORRECEBIDO'
    end
    object qrycontribDATA: TDateTimeField
      DisplayLabel = 'Data do Recebimento'
      DisplayWidth = 10
      FieldName = 'DATA'
      Origin = '"CM.HSTCONTRIBASS".DATA'
    end
    object qrycontribMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Origin = '"CM.HSTCONTRIBASS".MESCOBRANCA'
      Size = 7
    end
    object qrycontribNOME: TStringField
      DisplayLabel = 'Titular'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qrycontribDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Origin = '"CM.MOTIVO".DESCRICAO'
      Size = 50
    end
    object qrycontribIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qrycontribIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
  end
  object dscontrib: TwwDataSource
    AutoEdit = False
    DataSet = qrycontrib
    Left = 215
    Top = 12
  end
  object qryHstVersoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select h.idtitular,h.idresponsavel,h.idpessoa, mes, mescobranca,' +
        ' liqreceb.liqrecebido,'
      
        '       liqreceb.liqprevisto, decode(pr.flgdesconto,1,'#39'-'#39','#39'+'#39') as' +
        ' flgdesconto,'
      
        '       h.valorprovento,h.valorrecebido, h.idrubrica, pr.descrica' +
        'o as descprovento,'
      
        '       h.coddocumento, p.nome as recebedor, h.numbanco, h.numage' +
        'ncia, h.contacorrente,'
      
        '       h.codportforma, pf.descricao as descportador, hfcap.nomet' +
        'xt,'
      
        '       decode(d.status,'#39'2'#39','#39'Pago'#39','#39'em Aberto'#39') as sitdocpagto, d' +
        '.dataprogramada'
      
        'from histrubsal h, pessoa p, hstfolhabenef hf, hstfolhabenefcap ' +
        'hfcap, documento d,'
      '     provdesc pr, portadorforma pf,'
      '     (select idtitular, idresponsavel,'
      
        '             sum(decode(pr.flgdesconto,1,-valorrecebido,valorrec' +
        'ebido)) as liqrecebido,'
      
        '             sum(decode(pr.flgdesconto,1,-valorprovento,valorpro' +
        'vento)) as liqprevisto'
      '             from histrubsal h, provdesc pr'
      
        '             where idhstfolhabenef = :IDHSTFOLHABENEF and idtitu' +
        'lar = :IDTITULAR and'
      '                   h.idrubrica = pr.idprovento'
      '             group by idtitular,idresponsavel) liqreceb'
      'where h.idhstfolhabenef = :IDHSTFOLHABENEF'
      'and h.idtitular         = :IDTITULAR'
      'and h.idresponsavel     = :IDRESPONSAVEL'
      'and h.idresponsavel     = p.idpessoa(+)'
      'and hf.idhstfolhabenef  = :IDHSTFOLHABENEF'
      'and h.idrubrica         = pr.idprovento'
      'and h.codportforma      = pf.codportforma(+)'
      'and h.idhstfolhabenef   = hfcap.idhstfolhabenef(+)'
      'and h.coddocumento      = hfcap.coddocumento(+)'
      'and h.coddocumento      = d.coddocumento(+)'
      'and h.idtitular         = liqreceb.idtitular(+)'
      'and h.idresponsavel     = liqreceb.idresponsavel(+)'
      ''
      'order by h.idtitular,h.idresponsavel'
      ''
      ''
      '')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T'
      'VALORPROVENTO'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 270
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 1615
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 1215012
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
        Value = 1215012
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
    object qryHstVersoesMES: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 7
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryHstVersoesFLGDESCONTO: TStringField
      DisplayLabel = 'P/D'
      DisplayWidth = 1
      FieldName = 'FLGDESCONTO'
      Size = 1
    end
    object qryHstVersoesVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORPROVENTO'
    end
    object qryHstVersoesIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
    end
    object qryHstVersoesDESCPROVENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 130
      FieldName = 'DESCPROVENTO'
      Size = 130
    end
    object qryHstVersoesIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryHstVersoesIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
    object qryHstVersoesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryHstVersoesVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      Visible = False
    end
    object qryHstVersoesMESCOBRANCA: TStringField
      DisplayLabel = 'Mês Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object qryHstVersoesLIQRECEBIDO: TFloatField
      FieldName = 'LIQRECEBIDO'
      Visible = False
    end
    object qryHstVersoesLIQPREVISTO: TFloatField
      FieldName = 'LIQPREVISTO'
      Visible = False
    end
    object qryHstVersoesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryHstVersoesRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Visible = False
      Size = 60
    end
    object qryHstVersoesNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qryHstVersoesNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryHstVersoesCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Visible = False
      Size = 15
    end
    object qryHstVersoesCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryHstVersoesDESCPORTADOR: TStringField
      FieldName = 'DESCPORTADOR'
      Visible = False
      Size = 50
    end
    object qryHstVersoesNOMETXT: TStringField
      FieldName = 'NOMETXT'
      Visible = False
    end
    object qryHstVersoesSITDOCPAGTO: TStringField
      FieldName = 'SITDOCPAGTO'
      Visible = False
      Size = 9
    end
    object qryHstVersoesDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
      Visible = False
    end
  end
  object dsVersoes: TwwDataSource
    AutoEdit = False
    DataSet = qryVersoes
    Left = 329
    Top = 13
  end
  object dsHstVersoes: TwwDataSource
    AutoEdit = False
    DataSet = qryHstVersoes
    Left = 272
    Top = 12
  end
  object qryVersoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT H.IDHSTFOLHABENEF, HF.HISTORICO, HF.DATAPREVPAGT' +
        'O, HF.MESREFERENCIA'
      'FROM HISTRUBSAL H, HSTFOLHABENEF HF'
      'WHERE H.IDTITULAR = :IDTITULAR AND'
      '      H.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF(+)'
      'ORDER BY HF.MESREFERENCIA DESC, H.IDHSTFOLHABENEF DESC')
    PictureMasks.Strings = (
      
        'VALORRESULT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]]}'#9'T'#9'T'
      
        'VALORRESERVA'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 331
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 1215012
      end>
    object qryVersoesHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryVersoesIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.HISTRUBSAL.IDHSTFOLHABENEF'
      Visible = False
    end
    object qryVersoesDATAPREVPAGTO: TDateTimeField
      FieldName = 'DATAPREVPAGTO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.DATAPREVPAGTO'
      Visible = False
    end
    object qryVersoesMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Visible = False
      Size = 7
    end
  end
  object dsplanass: TwwDataSource
    AutoEdit = False
    DataSet = qryplanass
    Left = 387
    Top = 13
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANASS,'
      '       PL.NOME ,'
      '       SIT.DESCRICAO,'
      '       PV.NOME ,'
      '       PA.DATACANCELAMENTO'
      'FROM   PARTASS PA ,'
      '       SITPLANOASS SIT,'
      '       PLANPREV PV,'
      '       PLANASS PL'
      'WHERE (PA.IDPESSOA = :IDTITULAR)'
      'AND   (PA.IDPESSJUR =  :IDPESSJUR)'
      'AND   (PA.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (PA.IDSITPART = SIT.IDSITPLANOASS)'
      'AND   (PA.IDPLANOPREV = PV.IDPLANOPREV)'
      'AND   (PA.IDPLANASS = PL.IDPLANASS)')
    ValidateWithMask = True
    Left = 384
    Top = 13
    ParamData = <
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
        DataType = ftFloat
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryplanassIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = '"CM.PLANASS".IDPLANASS'
    end
    object qryplanassNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PLANASS".NOME'
      Size = 40
    end
    object qryplanassDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.SITPLANOPREV".DESCRICAO'
      Size = 50
    end
    object qryplanassNOME_1: TStringField
      FieldName = 'NOME_1'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object qryplanassDATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
      Origin = '"CM.PARTASS".DATACANCELAMENTO'
    end
  end
  object dspartprev: TwwDataSource
    AutoEdit = False
    DataSet = qrypartprev
    Left = 442
    Top = 14
  end
  object qrypartprev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        BE.IDPLANOORIGEM,'
      '        BE.IDPESSJUR,'
      '        DT.MATRICULA,'
      '        PBEN.NOME AS NOMEBENEF,'
      '        PBEN.IDPESSOA,'
      '        PV.NOME PLANPREV,'
      '        PBEN.NUMDOCUMENTO AS DOCBEN,'
      '        E.LOGRADOURO,'
      '        E.NUMERO,'
      '        E.BAIRRO,'
      '        E.CEP,'
      '        E.COMPLEMENTO ,'
      '        CD.NOME,'
      '        UF.NOMEESTADO,'
      '        T.DDD,'
      '        T.NUMERO AS NUMEROTEL,'
      '        T.TIPO,'
      '        PRESP.NOME AS NOMERESP,'
      '        BE.IDRESPONSAVEL,'
      '        BN.NOME AS BENEFICIO,'
      '        DT.VALORBASE1,'
      '        PT.NOMEVALORBASE1,'
      '        DC.NUMDOCUMENTO AS NUMDOCBEN'
      
        'FROM  BFCIARIOTITPLAN BE , PESSOA PBEN, DEPENTIT DT,  PLANPREV P' +
        'V,'
      
        '        ENDPESS E, TELENDPESS T, CIDADES CD, ESTADO UF, PESSOA P' +
        'RESP, BENEFICIO BN, PATRO PT, DOCPESSOA DC'
      'WHERE'
      '        (BE.IDTITULAR         = :IDTITULAR)'
      '/*AND     (BE.IDPESSJUR         = IDPESSJUR)'
      'AND     (BE.IDPLANOORIGEM     = IDPLANOPREV)*/'
      'AND     (BE.SEQPROPOSTA       = :SEQPROPOSTA)'
      'AND     (DT.IDTITULAR         = BE.IDTITULAR)'
      'AND     (DT.IDPESSOA          = BE.IDPESSOA)'
      'AND     (DT.IDDEPENDENCIA    <> '#39'PRP'#39')'
      'AND     (PBEN.IDPESSOA       = BE.IDPESSOA)'
      'AND     (BE.IDRESPONSAVEL    = PRESP.IDPESSOA(+))'
      'AND     (PV.IDPLANOPREV      = BE.IDPLANOPREV)'
      'AND     (BE.IDPESSOA         = E.IDPESSOA(+))'
      'AND     (E.IDENDERECO        = T.IDENDERECO(+))'
      'AND     (E.IDCIDADES         = CD.IDCIDADES(+))'
      'AND     (CD.IDESTADO         = UF.IDESTADO(+))'
      'AND     (BE.IDBENEFICIO      = BN.IDBENEFICIO)'
      'AND     (BE.IDPESSJUR        = PT.IDPESSOA)'
      'AND     (DC.IDPESSOA(+)         = PBEN.IDPESSOA)'
      'AND     (DC.IDDOCUMENTO(+)   = 2)'
      'ORDER BY PBEN.NOME ASC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 439
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
        Value = 1323341
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
    object qrypartprevIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qrypartprevIDPESSJUR2: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qrypartprevMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qrypartprevNOMEBENEF: TStringField
      FieldName = 'NOMEBENEF'
      Size = 60
    end
    object qrypartprevIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrypartprevPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qrypartprevDOCBEN: TStringField
      FieldName = 'DOCBEN'
      FixedChar = True
      Size = 18
    end
    object qrypartprevLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qrypartprevNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qrypartprevBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qrypartprevCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrypartprevCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qrypartprevNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qrypartprevNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qrypartprevDDD: TStringField
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object qrypartprevNUMEROTEL: TStringField
      FieldName = 'NUMEROTEL'
    end
    object qrypartprevTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 5
    end
    object qrypartprevNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qrypartprevIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qrypartprevBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qrypartprevVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qrypartprevNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qrypartprevNUMDOCBEN: TStringField
      FieldName = 'NUMDOCBEN'
      FixedChar = True
      Size = 18
    end
  end
  object dsplanprev: TwwDataSource
    AutoEdit = False
    DataSet = qryplanprev
    Left = 501
    Top = 15
  end
  object qryplanprev: TwwQuery
    Tag = 1
    AfterScroll = qryplanprevAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '             PL.IDPLANOPREV,'
      '             PL.NOME, '
      '             SIT.DESCRICAO,'
      '             SITPART.DESCRICAO SITPART,'
      '             PA.INSCRICAODATA,'
      '             PA.INSCRICAONUMERO,'
      '             PA.SALPARTICIPACAO,'
      '             PA.SALMANTIDO,'
      '             PA.DATACANCELAMENTO,'
      '             PA.DATAINICIOMANUT,'
      '             PA.DTINICIOINSC,'
      '             PA.FLGFITESPECIAL,'
      '             P.NOME AS PATROCINADORA'
      'FROM'
      '             PARTPREVPLAN PA ,'
      '             SITPLANOPREV SIT,'
      '             SITPART,'
      '             PLANPREV PL, '
      '             PESSOA P'
      'WHERE'
      '             (PA.IDPESSOA =  :IDTITULAR)'
      'AND     (PA.IDSITPLANOPREV = SIT.IDSITPLANOPREV)'
      'AND     (PA.IDSITPART = SITPART.IDSITPART)'
      'AND     (PL.IDPLANOPREV = PA.IDPLANOPREV)'
      'AND     (PA.IDPESSJUR = P.IDPESSOA)'
      'ORDER BY PA.FLGDESATIVADO, PA.DTINICIOINSC DESC'
      ' ')
    ControlType.Strings = (
      'FLGFITESPECIAL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 498
    Top = 14
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryplanprevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryplanprevNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryplanprevDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITPLANOPREV.DESCRICAO'
      Size = 50
    end
    object qryplanprevSITPART: TStringField
      FieldName = 'SITPART'
      Origin = 'BASEDADOS.SITPART.DESCRICAO'
      Size = 50
    end
    object qryplanprevINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
      Origin = 'BASEDADOS.PARTPREVPLAN.INSCRICAODATA'
    end
    object qryplanprevINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.PARTPREVPLAN.INSCRICAONUMERO'
    end
    object qryplanprevSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
      Origin = 'BASEDADOS.PARTPREVPLAN.SALPARTICIPACAO'
    end
    object qryplanprevSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
      Origin = 'BASEDADOS.PARTPREVPLAN.SALMANTIDO'
    end
    object qryplanprevDATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
      Origin = 'BASEDADOS.PARTPREVPLAN.DATACANCELAMENTO'
    end
    object qryplanprevDATAINICIOMANUT: TDateTimeField
      FieldName = 'DATAINICIOMANUT'
      Origin = 'BASEDADOS.PARTPREVPLAN.DATAINICIOMANUT'
    end
    object qryplanprevDTINICIOINSC: TDateTimeField
      FieldName = 'DTINICIOINSC'
      Origin = 'BASEDADOS.PARTPREVPLAN.DTINICIOINSC'
    end
    object qryplanprevFLGFITESPECIAL: TFloatField
      FieldName = 'FLGFITESPECIAL'
      Origin = 'BASEDADOS.PARTPREVPLAN.FLGFITESPECIAL'
    end
  end
  object qryDocTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.NOMEDOCUMENTO,'
      '       D.NUMDOCUMENTO,'
      '       D.ORGAO,'
      '       D.DATAEMISSAO,'
      '       NVL( E.CODESTADO, D.UF ) AS UF,'
      '       E.NOMEESTADO,'
      '       P.NOMEPAIS'
      'FROM   DOCPESSOA D,'
      '       TIPODOCPESSOA T,'
      '       ESTADO E,'
      '       PAIS P'
      'WHERE  D.IDPESSOA    = :IDPESSOA AND'
      '       D.IDDOCUMENTO = T.IDDOCUMENTO AND'
      '       D.IDESTADO    = E.IDESTADO(+) AND'
      '       D.IDPAIS      = P.IDPAIS(+)')
    ValidateWithMask = True
    Left = 7
    Top = 65
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
        Value = 8
      end>
    object qryDocTitularNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 30
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
    object qryDocTitularNUMDOCUMENTO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.DOCPESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDocTitularDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Data Emissão'
      DisplayWidth = 12
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.DOCPESSOA.DATAEMISSAO'
    end
    object qryDocTitularNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object qryDocTitularNOMEPAIS: TStringField
      DisplayLabel = 'País'
      DisplayWidth = 26
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
    object qryDocTitularORGAO: TStringField
      DisplayLabel = 'Órgão'
      DisplayWidth = 10
      FieldName = 'ORGAO'
      Origin = 'BASEDADOS.DOCPESSOA.ORGAO'
      Size = 30
    end
    object qryDocTitularUF: TStringField
      DisplayWidth = 3
      FieldName = 'UF'
      Origin = 'BASEDADOS.DOCPESSOA.UF'
      FixedChar = True
      Size = 3
    end
  end
  object dsDocTitular: TwwDataSource
    AutoEdit = False
    DataSet = qryDocTitular
    Left = 9
    Top = 66
  end
  object qryendereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT      ENDPESS.NOME,'
      '             ENDPESS.LOGRADOURO ,'
      '             ENDPESS.NUMERO ,'
      '             ENDPESS.COMPLEMENTO ,'
      '             ENDPESS.BAIRRO ,'
      '             CIDADES.NOME AS CIDADE ,'
      '             ESTADO.NOMEESTADO AS ESTADO,'
      '             ESTADO.CODESTADO AS UF,'
      '             ENDPESS.CEP ,'
      '             PAIS.NOMEPAIS'
      'FROM '
      '             ENDPESS, '
      '             PAIS, '
      '             ESTADO, '
      '             CIDADES'
      'WHERE (ENDPESS.IDPESSOA = :IDTITULAR)'
      'AND   (ENDPESS.IDCIDADES = CIDADES.IDCIDADES)'
      'AND   (ESTADO.IDPAIS = PAIS.IDPAIS(+))'
      'AND   (CIDADES.IDESTADO = ESTADO.IDESTADO(+))'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 66
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 1235087
      end>
    object qryenderecoNOME: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 40
    end
    object qryenderecoLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 30
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryenderecoNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryenderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
    end
    object qryenderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'BAIRRO'
    end
    object qryenderecoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 30
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryenderecoESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 30
      FieldName = 'ESTADO'
      Size = 30
    end
    object qryenderecoUF: TStringField
      DisplayWidth = 3
      FieldName = 'UF'
      Size = 3
    end
    object qryenderecoCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object qryenderecoNOMEPAIS: TStringField
      DisplayLabel = 'País'
      DisplayWidth = 20
      FieldName = 'NOMEPAIS'
      Size = 30
    end
  end
  object dsendereco: TwwDataSource
    AutoEdit = False
    DataSet = qryendereco
    Left = 63
    Top = 67
  end
  object qryParcelamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'P.IDPARCELAMENTO,'
      'P.DATACANCELAMENTO,'
      'P.MOTIVOCANCEL,'
      'P.VLRDIVIDAPART,'
      'P.VLRDIVIDAPATRO,'
      'P.SDODEVEDOR,'
      'P.FLGDESCFOLHA,'
      'P.NUMPARCELAS,'
      'P.PARCPAGAS,'
      'P.PARCGERADAS,'
      'P.VLRPRIMPRESTACAO,'
      'P.PERCENTUAL,'
      'P.VLRSALBASE,'
      
        'DECODE(P.SITPARCELAMENTO,1,'#39'Normal'#39',2,'#39'Quitado'#39',3,'#39'Quitado por M' +
        'orte'#39','
      
        '                         4,'#39'Quitado por Invalidez'#39',5,'#39'Cancelado'#39 +
        ','
      
        '                         6,'#39'Refinanciado'#39') AS DESCSITPARCELAMENT' +
        'O,'
      'P.DATAINICIO,'
      'P.TPCOMPRACARENCIA,'
      'P.DESCOPCOES,'
      'P.PERCSEGURO'
      'FROM'
      '      PARCELAMENTO P'
      'WHERE'
      '      (P.IDPESSOA       = :idpessoa)'
      'AND   (P.IDPLANOPREV    = :idplanoprev)'
      'AND   (P.IDPESSJUR      = :idpessjur)'
      'AND   (P.SEQPROPOSTA    = :seqproposta)'
      'AND   (P.TPCOMPRACARENCIA IS NULL)'
      ''
      '')
    ValidateWithMask = True
    Left = 117
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
        Value = 302875
      end
      item
        DataType = ftString
        Name = 'idplanoprev'
        ParamType = ptUnknown
        Value = 19
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'seqproposta'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsParcelamento: TwwDataSource
    AutoEdit = False
    DataSet = qryParcelamento
    Left = 114
    Top = 67
  end
  object dscontribprev: TwwDataSource
    AutoEdit = False
    DataSet = qrycontribprev
    Left = 169
    Top = 68
  end
  object qrycontribprev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MT.DESCRICAO AS MOTIVO,'
      '  HST.MESREFERENCIA,'
      '  HST.MESCOBRANCA,'
      '  HST.VALORESPERADO,'
      '  HST.DATARECEBIMENTO,'
      '  HST.VALORRECEBIDO,'
      '  HST.QUANTCOTAS,'
      '  P.NOME,'
      '  EL.MATRICULA,'
      '  PL.NOME PLANPREV ,'
      '  HST.FLGDEVOLUCAO,'
      '  DECODE(HST.SITRECEBIMENTO,'
      '  '#39'0'#39','#39'Não Enviado'#39',DECODE(HST.SITRECEBIMENTO,'
      '  '#39'1'#39','#39'Enviado e não Recebido'#39',DECODE(HST.SITRECEBIMENTO,'
      '  '#39'2'#39','#39'Recebido OK'#39',DECODE(HST.SITRECEBIMENTO,'
      
        '  '#39'3'#39','#39'Recebido Com Divergência e não tratado'#39',DECODE(HST.SITREC' +
        'EBIMENTO,'
      
        '  '#39'4'#39','#39'Recebido Com Divergência e tratado'#39',DECODE(HST.SITRECEBIM' +
        'ENTO,'
      '  '#39'5'#39','#39'Pagou a Divergência'#39',DECODE(HST.SITRECEBIMENTO,'
      
        '  '#39'6'#39','#39'Divergência enviada e não recebida'#39',DECODE(HST.SITRECEBIM' +
        'ENTO,'
      '  '#39'7'#39','#39'Financiado ou Renegociado'#39',DECODE(HST.SITRECEBIMENTO,'
      
        '  '#39'8'#39','#39'Cancelada'#39','#39'Contribuição atrasada a cobrar na folha de be' +
        'nefícios'#39'))))))))) AS DESCRICAO,'
      '  CONT.NOME CONTRIB,'
      '  HST.DATAFINAL,       HST.PARCELA,'
      
        '  TP.NOME, DECODE(HST.FLGCALCRESERVA,1,'#39'Sim'#39','#39'Não'#39') AS FLGCALCRE' +
        'SERVA,'
      '  HST.VALOROP1, HST.VALOROP2, HST.VALOROP3,'
      '  CP.IDCONTRIBPAI, CP.IDCONTRIBPAI2, CP.IDCONTRIBPAI3'
      'FROM'
      '  HSTCONTRIBPREV HST,'
      '  PATRO PT,'
      '  ELEGPATRO EL ,'
      '  PARTPREVPLAN PPP,'
      '  PESSOA  P ,'
      '  CONTRIBPREVPARTP CPP,'
      '  CONTPREV CP,'
      '  CONTRIBUICAO CONT,'
      '  TPPERIODICIDADE TP,'
      '  MOTIVO MT,'
      '  PLANPREV PL'
      ''
      'WHERE'
      '          (HST.IDPESSOA = :IDTITULAR)'
      'AND       (P.IDPESSOA   = :IDTITULAR)'
      'AND       (PPP.IDPESSOA = :IDTITULAR)'
      'AND       (EL.IDPESSOA  = :IDTITULAR)'
      ''
      'AND       (HST.IDPLANOPREV = :IDPLANOPREV)'
      'AND       (PPP.IDPLANOPREV = :IDPLANOPREV)'
      ''
      'AND       (HST.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND       (PPP.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND       (CPP.SEQPROPOSTA = :SEQPROPOSTA)'
      ''
      'AND       (PT.IDPESSOA         = HST.IDPESSJUR)'
      'AND       (HST.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)'
      'AND       (HST.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO)'
      'AND       (HST.IDCONTRIBUICAO  = CONT.IDCONTRIBUICAO)'
      'AND       (HST.IDMOTIVO        = MT.IDMOTIVO)'
      'AND       (EL.IDPESSJUR        = HST.IDPESSJUR)'
      'AND       (EL.IDPESSOA         = HST.IDPESSOA)'
      'AND       (PPP.IDPESSJUR       = HST.IDPESSJUR)'
      'AND       (PPP.IDPESSOA        = HST.IDPESSOA)'
      'AND       (PPP.IDPLANOPREV     = HST.IDPLANOPREV)'
      'AND       (PPP.SEQPROPOSTA     = HST.SEQPROPOSTA)'
      'AND       (P.IDPESSOA          = HST.IDPESSOA)'
      'AND       (CPP.IDPESSJUR       = HST.IDPESSJUR)'
      'AND       (CPP.IDPESSOA        = HST.IDPESSOA)'
      'AND       (CPP.IDPLANOPREV     = HST.IDPLANOPREV)'
      'AND       (CPP.SEQPROPOSTA     = HST.SEQPROPOSTA)'
      'AND       (CP.IDPLANOPREV      = HST.IDPLANOPREV)'
      'AND       (CONT.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+))'
      'AND       (PL.IDPLANOPREV      = HST.IDPLANOPREV)'
      ''
      'ORDER BY HST.MESREFERENCIA DESC, HST.MESCOBRANCA DESC'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0')
    PictureMasks.Strings = (
      'VALORESPERADO'#9'###,###,###,##0.00'#9'F'#9'T'
      'VALORRECEBIDO'#9'###,###,###,##0.00'#9'F'#9'T')
    ValidateWithMask = True
    Left = 166
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
    object qrycontribprevMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qrycontribprevMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qrycontribprevVALORESPERADO: TFloatField
      FieldName = 'VALORESPERADO'
    end
    object qrycontribprevDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qrycontribprevVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qrycontribprevQUANTCOTAS: TFloatField
      FieldName = 'QUANTCOTAS'
    end
    object qrycontribprevNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrycontribprevMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qrycontribprevPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qrycontribprevFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
    object qrycontribprevDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 53
    end
    object qrycontribprevCONTRIB: TStringField
      FieldName = 'CONTRIB'
      Size = 60
    end
    object qrycontribprevDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qrycontribprevPARCELA: TFloatField
      FieldName = 'PARCELA'
    end
    object qrycontribprevNOME_1: TStringField
      FieldName = 'NOME_1'
      FixedChar = True
      Size = 30
    end
    object qrycontribprevFLGCALCRESERVA: TStringField
      FieldName = 'FLGCALCRESERVA'
      Size = 3
    end
    object qrycontribprevMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 50
    end
    object qrycontribprevVALOROP1: TFloatField
      FieldName = 'VALOROP1'
    end
    object qrycontribprevVALOROP2: TFloatField
      FieldName = 'VALOROP2'
    end
    object qrycontribprevVALOROP3: TFloatField
      FieldName = 'VALOROP3'
    end
    object qrycontribprevIDCONTRIBPAI: TFloatField
      FieldName = 'IDCONTRIBPAI'
    end
    object qrycontribprevIDCONTRIBPAI2: TFloatField
      FieldName = 'IDCONTRIBPAI2'
    end
    object qrycontribprevIDCONTRIBPAI3: TFloatField
      FieldName = 'IDCONTRIBPAI3'
    end
  end
  object dsOutrasInforms: TwwDataSource
    DataSet = qryOutrasInforms
    Left = 226
    Top = 69
  end
  object qryOutrasInforms: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSOA, PP.IDPARAM, PP.DATAINICIO, PP.DATAFIM, PP.VA' +
        'LOR,'
      '       PF.DESCRICAO, PF.TIPO, PF.VALIDACAO'
      'FROM PESSOAPARAM PP, PARAMFLAGPESSOA PF'
      'WHERE  PP.IDPESSOA = :IdPessoa AND'
      '       PP.IDPARAM  = PF.IDPARAM'
      'ORDER BY PF.DESCRICAO')
    ValidateWithMask = True
    Left = 223
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptInput
        Value = 52462
      end>
    object qryOutrasInformsDESCRICAO: TStringField
      DisplayLabel = 'Parâmetro'
      DisplayWidth = 37
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PARAMFLAGPESSOA.DESCRICAO'
      Size = 30
    end
    object qryOutrasInformsIDPARAM: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPARAM'
      Origin = 'BASEDADOS.PESSOAPARAM.IDPARAM'
    end
    object qryOutrasInformsDATAINICIO: TDateTimeField
      DisplayLabel = 'Data início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.PESSOAPARAM.DATAINICIO'
    end
    object qryOutrasInformsDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DATAFIM'
      Origin = 'BASEDADOS.PESSOAPARAM.DATAFIM'
    end
    object qryOutrasInformsVALOR: TStringField
      DisplayLabel = 'Conteúdo'
      DisplayWidth = 30
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.PESSOAPARAM.VALOR'
      Size = 30
    end
    object qryOutrasInformsIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOAPARAM.IDPESSOA'
      Visible = False
    end
    object qryOutrasInformsTIPO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.PARAMFLAGPESSOA.TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOutrasInformsVALIDACAO: TStringField
      DisplayWidth = 30
      FieldName = 'VALIDACAO'
      Origin = 'BASEDADOS.PARAMFLAGPESSOA.VALIDACAO'
      Visible = False
      Size = 30
    end
  end
  object qryContaCorrentePartPrev: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dspartprev
    SQL.Strings = (
      'SELECT'
      '  c.contacorrente, c.idagencia, c.tipoconta, c.flgcontaconjunta,'
      
        '  pa.nome as nomeagencia, pb.nome as nomebanco, a.numagencia, a.' +
        'idbanco,'
      '  b.numbanco, decode(c.flgcontapref,1,'#39'Sim'#39','#39'Não'#39') as contapref,'
      
        '  decode(c.tipoconta,1,'#39'Corrente'#39',2,'#39'Salário'#39',3,'#39'Poupança'#39') as t' +
        'pConta'
      
        'FROM pessoa pa, pessoa pb, agenciabancaria a, banco b, contabanc' +
        'aria c'
      'WHERE'
      '        (:IDRESPONSAVEL       = c.idpessoa(+))'
      'AND     (c.idagencia         = pa.idpessoa(+))'
      'AND     (c.idagencia         = a.idpessoa(+))'
      'AND     (a.idbanco           = pb.idpessoa(+))'
      'AND     (a.idbanco           = b.idpessoa(+))'
      ' ')
    ValidateWithMask = True
    Left = 283
    Top = 69
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptInput
      end>
    object qryContaCorrentePartPrevNUMBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 4
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryContaCorrentePartPrevNOMEBANCO: TStringField
      DisplayLabel = 'Nome do Banco'
      DisplayWidth = 30
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object qryContaCorrentePartPrevNUMAGENCIA: TStringField
      DisplayLabel = 'Num. Agência'
      DisplayWidth = 10
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryContaCorrentePartPrevNOMEAGENCIA: TStringField
      DisplayLabel = 'Nome da Agência'
      DisplayWidth = 30
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object qryContaCorrentePartPrevCONTACORRENTE: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryContaCorrentePartPrevCONTAPREF: TStringField
      DisplayLabel = 'Conta Pref.'
      DisplayWidth = 3
      FieldName = 'CONTAPREF'
      Size = 3
    end
    object qryContaCorrentePartPrevIDBANCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBANCO'
      Visible = False
    end
    object qryContaCorrentePartPrevTPCONTA: TStringField
      DisplayWidth = 8
      FieldName = 'TPCONTA'
      Visible = False
      Size = 8
    end
    object qryContaCorrentePartPrevIDAGENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENCIA'
      Visible = False
    end
    object qryContaCorrentePartPrevTIPOCONTA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContaCorrentePartPrevFLGCONTACONJUNTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONTACONJUNTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DsContaCorrentePartPrev: TwwDataSource
    DataSet = qryContaCorrentePartPrev
    Left = 286
    Top = 70
  end
  object qryPlanoBenefciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      '  BF.IDPLANOPREV,'
      '  BF.SEQPROPOSTA,'
      '  PL.NOME'
      'FROM BENEFBFCIARIO BF, PLANPREV PL'
      'WHERE BF.IDTITULAR = :idtitular AND'
      '      BF.IDPESSOA = :idpessoa  AND'
      '      BF.IDPLANOPREV = PL.IDPLANOPREV')
    ValidateWithMask = True
    Left = 336
    Top = 69
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
  object dsPlanoBenefciario: TwwDataSource
    DataSet = qryPlanoBenefciario
    Left = 339
    Top = 70
  end
  object qryMessagemFiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DATAINCLUSAO,'
      '  FLGEXIBEMSG, '
      '  DATAEXPIRAMSG,'
      '  DESCRICAO '
      'FROM FIARIO'
      'WHERE IDTITULAR = :idtitular AND'
      '      IDPESSOA  = :idpessoa AND'
      '      FLGEXIBEMSG = 1  AND'
      '      (DATAEXPIRAMSG > SYSDATE OR DATAEXPIRAMSG IS NULL)'
      'ORDER BY DATAINCLUSAO ASC'
      '')
    ValidateWithMask = True
    Left = 391
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
  end
  object Regra1: TRegra
    IdCalculo = 0
    IdEmpresa = -1
    Left = 16
    Top = 208
  end
  object qryVidaFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  P.NOME AS PATROCINADORA,'
      '  EL.MATRICULA,'
      '  EL.IDPESSJUR,  '
      '  EL.DATAINICIOAFAST,'
      '  EL.DATAFIMAFAST,'
      '  EL.DATAADMISSAO,'
      '  EL.DATADEMISSAO,'
      '  EL.DATAREADMISSAO,'
      '  EL.IDPESSOA'
      'FROM ELEGPATRO EL, PESSOA P'
      'WHERE EL.IDPESSOA = :IDPESSOA'
      '      AND EL.IDPESSJUR = P.IDPESSOA '
      'ORDER BY EL.DATAADMISSAO'
      '')
    ValidateWithMask = True
    Left = 440
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object dsVidaFundacao: TwwDataSource
    DataSet = qryVidaFundacao
    Left = 440
    Top = 72
  end
  object qryVidaFundDet: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsVidaFundacao
    SQL.Strings = (
      'SELECT'
      '  PPP.INSCRICAONUMERO,'
      '  PP.NOME AS PLANO,'
      '  DECODE(PPP.FLGDESATIVADO, 1, '#39'Sim'#39', '#39'Não'#39') AS FLGDESATIVADO,'
      '  PPP.INSCRICAODATA,'
      '  PPP.DATACANCELAMENTO,'
      '  PPP.DATAINICIOASSIST, '
      '  PPP.DATAFIMASSIST,'
      '  PPP.IDPESSJUR'
      'FROM PARTPREVPLAN PPP, PLANPREV PP'
      'WHERE PPP.IDPESSOA        = :IDPESSOA'
      '      AND PPP.IDPESSJUR   = :IDPESSJUR'
      '      AND PPP.IDPLANOPREV = PP.IDPLANOPREV'
      'ORDER BY PPP.INSCRICAODATA')
    ValidateWithMask = True
    Left = 496
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end>
    object qryVidaFundDetINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 10
      FieldName = 'INSCRICAONUMERO'
    end
    object qryVidaFundDetPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 35
      FieldName = 'PLANO'
      Size = 50
    end
    object qryVidaFundDetFLGDESATIVADO: TStringField
      DisplayLabel = 'Desativado'
      DisplayWidth = 3
      FieldName = 'FLGDESATIVADO'
      Size = 3
    end
    object qryVidaFundDetINSCRICAODATA: TDateTimeField
      DisplayLabel = 'Dt.Inscrição'
      DisplayWidth = 18
      FieldName = 'INSCRICAODATA'
    end
    object qryVidaFundDetDATACANCELAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Cancelamento'
      DisplayWidth = 18
      FieldName = 'DATACANCELAMENTO'
    end
    object qryVidaFundDetDATAINICIOASSIST: TDateTimeField
      DisplayLabel = 'Dt. Início Assist.'
      DisplayWidth = 18
      FieldName = 'DATAINICIOASSIST'
    end
    object qryVidaFundDetDATAFIMASSIST: TDateTimeField
      DisplayLabel = 'Dt. Final Assist.'
      DisplayWidth = 18
      FieldName = 'DATAFIMASSIST'
    end
  end
  object dsVidaFundDet: TwwDataSource
    DataSet = qryVidaFundDet
    Left = 496
    Top = 72
  end
  object qryDadosTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.NOME AS PATRO,'
      '  SF.DESCRICAO AS SITUACAONAPATRO,'
      '  SIT.DESCRICAO SITPART,'
      '  PPP.IDPESSJUR'
      
        'FROM ELEGPATRO EL, SITFUNC SF, SITPART SIT, PARTPREVPLAN PPP, PE' +
        'SSOA PJ '
      'WHERE (EL.IDPESSOA   = :IDTITULAR) '
      'AND   (EL.IDPESSOA   = PPP.IDPESSOA(+))'
      'AND   (EL.IDPESSJUR  = PPP.IDPESSJUR(+))'
      'AND   (SF.IDSITFUNC  = EL.IDSITFUNC)'
      'AND   (PPP.IDSITPART = SIT.IDSITPART(+))'
      'AND   ((PPP.FLGDESATIVADO = 1 AND PPP.IDPESSOA NOT IN'
      '       (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1'
      
        '        WHERE PPP1.IDPESSOA = PPP.IDPESSOA AND PPP1.IDPESSOA = P' +
        'PP1.IDPESSOA AND PPP.IDPESSJUR = PPP1.IDPESSJUR '
      
        '          AND NVL(PPP1.FLGDESATIVADO, 0) = 0 )) OR NVL(PPP.FLGDE' +
        'SATIVADO, 0) = 0)'
      'AND   (EL.IDPESSJUR = PJ.IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 8
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object dsDadosTitular: TwwDataSource
    DataSet = qryDadosTitular
    Left = 8
    Top = 120
  end
  object qryPlanoContabAtivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PPC.NOME AS PLANPCONTAB'
      'FROM CONTRIBPREVPARTP CPP,  PLANPREVCONTABIL PPC,'
      
        '     (SELECT MAX(IDCONTRIBUICAO) AS IDCONTRIBUICAO FROM CONTRIBP' +
        'REVPARTP WHERE IDPESSOA = :idpessoa )  CPP2'
      'WHERE CPP.IDPESSOA = :idpessoa AND '
      '      CPP.IDCONTRIBUICAO = CPP2.IDCONTRIBUICAO AND'
      
        '     PPC.IDPLANOPREV = NVL(CPP.IDPLANPREVCONTAB, CPP.IDPLANOPREV' +
        ')'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
  end
  object dsPlanoContabAtivo: TwwDataSource
    DataSet = qryPlanoContabAtivo
    Left = 56
    Top = 120
  end
  object qryPlanoContabAssist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  PPC.NOME AS PLANPCONTAB'
      'FROM BENEFBFCIARIO BF,  PLANPREVCONTABIL PPC, '
      '     (SELECT MAX(DATAINICIO) AS DATAINICIO FROM BENEFBFCIARIO '
      '      WHERE IDPLANOPREV =  :idplanoprev  AND'
      '            IDPESSJUR   = :idpessjur  AND'
      '            IDTITULAR   = :idtitular AND '
      '            IDPESSOA    = :idpessoa) BF1'
      'WHERE BF.IDPLANOPREV = :idplanoprev      AND'
      '      BF.IDPESSJUR   = :idpessjur AND'
      '      BF.IDTITULAR   = :idtitular AND '
      '      BF.IDPESSOA    = :idpessoa AND '
      '      BF.DATAINICIO   = BF1.DATAINICIO AND'
      '      PPC.IDPLANOPREV = NVL(BF.IDPLANPREVCONTAB, BF.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 104
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
  end
  object dsPlanoContabAssist: TwwDataSource
    DataSet = qryPlanoContabAssist
    Left = 104
    Top = 120
  end
  object QryBuscaCancPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       EP1.IDPESSOA, '
      '       EP1.IDPLANOPREV, '
      '       EP1.IDPESSJUR, '
      '       DT.DATAMIGRACAO,'
      '       PP1.INSCRICAODATA,'
      '       PP1.DATACANCELAMENTO   '
      'FROM EVENTOGERADOR EG1, EVENTOSPREV EP1, PARTPREVPLAN PP1,'
      '     (SELECT EP.IDPESSOA,'
      '             MAX(EP.DATAEVENTO) AS DATAMIGRACAO'
      '      FROM EVENTOGERADOR EG, EVENTOSPREV EP, PARTPREVPLAN PP'
      '      WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND '
      '            EG.FLGINTERNO      = '#39'CP'#39' AND '
      '            EP. IDPESSOA       = :idpessoa AND'
      '            PP.IDPESSOA        = EP.IDPESSOA AND '
      '            PP.IDPLANOPREV     = EP.IDPLANOPREV AND '
      '            PP.IDPESSJUR       = EP.IDPESSJUR  AND '
      '            PP.FLGDESATIVADO   = 1'
      '      GROUP BY EP.IDPESSOA) DT'
      'WHERE EG1.IDEVENTOGERADOR = EP1.IDEVENTOGERADOR AND '
      '      EG1.FLGINTERNO      = '#39'CP'#39' AND '
      '      EP1. IDPESSOA       = :idpessoa AND'
      '      PP1.IDPESSOA        = EP1.IDPESSOA AND '
      '      PP1.IDPLANOPREV     = EP1.IDPLANOPREV AND '
      '      PP1.IDPESSJUR       = EP1.IDPESSJUR  AND '
      '      PP1.FLGDESATIVADO   = 1 AND'
      '      EP1.DATAEVENTO      = DT.DATAMIGRACAO')
    ValidateWithMask = True
    Left = 148
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
  end
  object qryPlanPrevBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    DISTINCT'
      '    PPP.INSCRICAONUMERO, '
      '    PPP.SALMANTIDO, '
      '    PPP.SALPARTICIPACAO, '
      '    BF.IDPLANOPREV,                           '
      '    PP.NOME AS PLANOPREV,    '
      '  BF.DATAINICIO AS DATAINSCRICAO,'
      '  BF.DATAFINAL AS DATACANCELAMENTO'
      'FROM BENEFBFCIARIO BF,PLANPREV PP, PARTPREVPLAN PPP,'
      
        '    (SELECT M1.IDPESSOA, M1.IDTITULAR, M1.IDPLANOPREV, M1.IDPESS' +
        'JUR, M1.DATAMOV AS DATACANCELAMENTO FROM MOVBENEF M1 '
      
        '     WHERE M1.IDPESSOA IN (SELECT M2.IDPESSOA FROM MOVBENEF M2 W' +
        'HERE TIPOMOV = 7 AND M2.DATAMOV = M1.DATAMOV AND M2.IDPESSOA = M' +
        '1.IDPESSOA)'
      '     AND M1.TIPOMOV = 4'
      '     AND IDTITULAR <> IDPESSOA) MB,'
      
        '    (SELECT M1.IDPESSOA, M1.IDTITULAR, M1.IDPLANOPREV, M1.IDPESS' +
        'JUR, M1.DATAMOV AS DATAINSCRICAO FROM MOVBENEF M1 '
      '     WHERE M1.TIPOMOV = 7 AND IDTITULAR <> IDPESSOA) MBC'
      '    '
      'WHERE BF.IDPESSOA = :IDPESSOA AND'
      '       BF.IDTITULAR     <> BF.IDPESSOA       AND'
      '      PP.IDPLANOPREV    = BF.IDPLANOPREV    AND'
      '      BF.IDTITULAR      = PPP.IDPESSOA(+)      AND'
      '      BF.IDPLANOPREV    = PPP.IDPLANOPREV(+)   AND'
      '      BF.IDPESSJUR      = PPP.IDPESSJUR(+)     AND'
      
        '      BF.SEQPROPOSTA    = PPP.SEQPROPOSTA(+)   AND              ' +
        '     '
      '      BF.IDPESSOA       = MB.IDPESSOA(+)    AND     '
      '      BF.IDTITULAR      = MB.IDTITULAR(+)   AND     '
      '      BF.IDPESSJUR      = MB.IDPESSJUR(+)   AND  '
      '      BF.IDPLANOPREV    = MB.IDPLANOPREV(+) AND  '
      '      BF.IDPESSOA       = MBC.IDPESSOA(+)   AND     '
      '      BF.IDTITULAR      = MBC.IDTITULAR(+)  AND     '
      '      BF.IDPESSJUR      = MBC.IDPESSJUR(+)  AND   '
      '      BF.IDPLANOPREV    = MBC.IDPLANOPREV(+)   ')
    ValidateWithMask = True
    Left = 200
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryPlanPrevBenefINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Nº de Inscrição'
      DisplayWidth = 10
      FieldName = 'INSCRICAONUMERO'
    end
    object qryPlanPrevBenefPLANOPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 40
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPlanPrevBenefDATAINSCRICAO: TDateTimeField
      DisplayLabel = 'Data de~Inscrição'
      DisplayWidth = 10
      FieldName = 'DATAINSCRICAO'
    end
    object qryPlanPrevBenefDATACANCELAMENTO: TDateTimeField
      DisplayLabel = 'Data de~Cancelamento'
      DisplayWidth = 10
      FieldName = 'DATACANCELAMENTO'
    end
    object qryPlanPrevBenefSALPARTICIPACAO: TFloatField
      DisplayLabel = 'Salário de~Participação'
      DisplayWidth = 10
      FieldName = 'SALPARTICIPACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryPlanPrevBenefSALMANTIDO: TFloatField
      DisplayLabel = 'Salário de~Manutenção'
      DisplayWidth = 10
      FieldName = 'SALMANTIDO'
      DisplayFormat = '#,##0.00'
    end
    object qryPlanPrevBenefIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
  object dsPlanPrevBenef: TwwDataSource
    DataSet = qryPlanPrevBenef
    Left = 208
    Top = 120
  end
  object dsContribSitAtualBeneficiario: TwwDataSource
    DataSet = qryContribSitAtualBeneficiario
    Left = 304
    Top = 120
  end
  object qryContribSitAtualBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   BF.IDNUCLEOFAMILIAR,'
      '   NF.IDRESPNUCLEO,'
      '   CTB.NOME,'
      '   DECODE(CN.FLGCOBRA, 1, '#39'Cobra'#39', '#39'Não Cobra'#39') AS SITCOBRANCA,'
      '   CN.DATAINICIO,'
      '   CN.DATAFINAL'
      
        'FROM BFCIARIOTITPLAN BF, NUCLEOFAMILIAR NF, CONTRIBPREVNUCLEO CN' +
        ', CONTRIBUICAO CTB, BENEFBFCIARIO BN'
      'WHERE BF.IDPESSOA = :idpessoa AND '
      '      BF.IDNUCLEOFAMILIAR IS NOT NULL AND'
      '      BF.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR AND'
      '      NF.IDNUCLEOFAMILIAR = CN.IDNUCLEOFAMILIAR AND'
      '      CTB.IDCONTRIBUICAO  = CN.IDCONTRIBUICAO AND'
      '      BF.IDPESSOA         = BN.IDPESSOA AND'
      '      BF.IDBENEFICIO      = BN.IDBENEFICIO AND'
      '      BF.IDPLANOPREV      = BN.IDPLANOPREV AND'
      '      BN.IDSITBENEFICIO   = 1')
    ValidateWithMask = True
    Left = 296
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptInput
      end>
  end
  object Dsp: TDataSetProvider
    DataSet = qryRes
    Constraints = True
    Left = 144
    Top = 232
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 144
    Top = 184
    object CdsPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 19
      FieldName = 'PATRO'
      Size = 60
    end
    object CdsSITPATRO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 15
      FieldName = 'SITPATRO'
      Size = 60
    end
    object CdsMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 15
    end
    object CdsCLASSIFICACAO: TStringField
      DisplayLabel = 'Identificação'
      DisplayWidth = 11
      FieldName = 'CLASSIFICACAO'
      Size = 12
    end
    object CdsNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object CdsNUMDOCUMENTO: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object CdsINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 10
      FieldName = 'INSCRICAONUMERO'
    end
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object CdsIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object CdsIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object CdsPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object CdsIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object CdsSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
  end
  object dsRes: TDataSource
    DataSet = Cds
    Left = 104
    Top = 232
  end
  object qryRes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT PE.IDPESSOA, PE.NOME, PE2.NOME AS PATRO, SFU.DES' +
        'CRICAO AS SITPATRO, PV.IDSITPART, SFU.DESCRICAO,'
      
        '                PE.EMAIL, DECODE(EL.MATRICULA,NULL,DT.MATRICULA,' +
        'EL.MATRICULA) AS MATRICULA, PV.PLANO, PV.IDPLANOPREV,'
      
        '                PV.SEQPROPOSTA, DECODE(PE.IDPESSOA,DT.IDTITULAR,' +
        #39'TITULAR'#39',PE.IDPESSOA,'#39'BENEFICIARIO'#39') AS CLASSIFICACAO,'
      
        '                EL.IDPESSJUR, DT.IDTITULAR, PV.INSCRICAONUMERO, ' +
        'PE.NUMDOCUMENTO'
      
        'FROM PESSOA PE, PESSOA PE2, ELEGPATRO EL, DEPENTIT DT, SITFUNC S' +
        'FU,'
      
        '   ( SELECT PP1.IDPLANOPREV, PP1.IDPESSOA, PP1.INSCRICAONUMERO, ' +
        'PP1.IDSITPART, PP2.NOME AS PLANO, PP1.SEQPROPOSTA'
      '     FROM PARTPREVPLAN PP1, PLANPREV PP2'
      '     WHERE PP1.FLGDESATIVADO = 0 '
      '       AND PP1.IDPLANOPREV = PP2.IDPLANOPREV ) PV'
      'WHERE ( PE.IDPESSOA IN (49424) )'
      '  AND ( PE.IDPESSOA      = EL.IDPESSOA(+) )'
      '  AND ( EL.IDSITFUNC     = SFU.IDSITFUNC(+) )'
      '  AND ( PE2.IDPESSOA     = EL.IDPESSJUR )'
      '  AND ( PE.IDPESSOA      = PV.IDPESSOA(+))'
      '  AND ( DT.IDPESSOA      = PE.IDPESSOA   )'
      '  AND ( DT.IDTITULAR     = DT.IDTITULAR  )'
      '  AND ( DT.IDDEPENDENCIA = DT.IDDEPENDENCIA )'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 184
  end
end
