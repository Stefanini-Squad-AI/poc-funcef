inherited RptCAFInvBensNaoEncont: TRptCAFInvBensNaoEncont
  Left = 242
  Top = 188
  Width = 322
  Height = 214
  Caption = 'Relação de Bens não Encontrados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relação de Bens não Encontrados'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Nº do Levantamento'
        Controle = tcMontaSelect
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        MontaSelect = MSInventBens
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 100
    FormWidth = 520
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpInvBensNaoEncont
    LabelEmpresa = ppLabel36
    LabelSistema = ppLabel37
  end
  object sqlInvBensNaoEncont: TCMSqlParams
    SQL.Strings = (
      'SELECT IB.IDINVENTARIOBENS,'
      '       IB.DATAINILEVANT,'
      '       IB.DATAFIMLEVANT,'
      '       B.PLACA,'
      '       (0.00) AS SALDOCONTAB,'
      '       B.DESBEM,'
      '       B.IDPESSOA,'
      '       B.IDBEM'
      'FROM INVENTARIOBENS IB,'
      '     ITENSINVBENS I,'
      '     BEM B'
      'WHERE I.IDINVENTARIOBENS = :IDINVENTARIOBENS'
      '  AND I.IDEMPRESA = :IDPESSOA'
      '  AND I.IIBFLGPLACA = 2'
      '  AND I.IDINVENTARIOBENS = IB.IDINVENTARIOBENS'
      '  AND I.IDEMPRESA = IB.IDEMPRESA'
      '  AND I.IIBIDBEM = B.IDBEM'
      '  AND I.IDEMPRESA = B.IDPESSOA'
      'ORDER BY B.PLACA'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsInvBensNaoEncont
    Left = 233
    Top = 62
  end
  object cdsInvBensNaoEncont: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 48
  end
  object dsInvBensNaoEncont: TwwDataSource
    DataSet = cdsInvBensNaoEncont
    Left = 232
    Top = 34
  end
  object ppInvBensNaoEncont: TppBDEPipeline
    DataSource = dsInvBensNaoEncont
    UserName = 'InvBensNaoEncont'
    Left = 231
    Top = 21
  end
  object rpInvBensNaoEncont: TppReport
    AutoStop = False
    DataPipeline = ppInvBensNaoEncont
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Relação de Bens não Encontrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 63765
        mmTop = 8731
        mmWidth = 69850
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = 'Levantamento Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17198
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label2'
        Caption = 'Data Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 82021
        mmTop = 17198
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        Caption = 'Encerrado em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 17198
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'IDINVENTARIOBENS'
        DataPipeline = ppInvBensNaoEncont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 17198
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINILEVANT'
        DataPipeline = ppInvBensNaoEncont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 17198
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFIMLEVANT'
        DataPipeline = ppInvBensNaoEncont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 173302
        mmTop = 17198
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label5'
        Caption = 'PLACA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 23813
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label6'
        Caption = 'DESCRIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 23813
        mmWidth = 16669
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 27516
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label4'
        Caption = 'SALDO CONTÁBIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 23813
        mmWidth = 24606
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLACA'
        DataPipeline = ppInvBensNaoEncont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESBEM'
        DataPipeline = ppInvBensNaoEncont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 0
        mmWidth = 138113
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'SALDOCONTAB'
        DataPipeline = ppInvBensNaoEncont
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 28840
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 62971
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 70115
        mmTop = 265
        mmWidth = 71702
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 265
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object MSInventBens: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Levantamento'
    Colunas.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'PESSOA.NOME'
      'INVENTARIOBENS.DATAINILEVANT'
      'INVENTARIOBENS.DATAFIMLEVANT')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº do Levantamento'
      'Responsável'
      'Data de Início'
      'Data de Término')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTARIOBENS'
      'PESSOA')
    CamposChave.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'INVENTARIOBENS.IDEMPRESA'
      'INVENTARIOBENS.DATAFIMLEVANT')
    Filtro.Strings = (
      'INVENTARIOBENS.IDRESPONSAVEL=PESSOA.IDPESSOA(+) ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 24
    Top = 128
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(G.DATAULTDEP) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND G.DATAULTDEP IS NOT NULL)'
      '  AND PG.IDGRUPO = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 24
    Top = 64
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 104
    Top = 64
  end
  object cdsSaldoContabBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 125
  end
  object sqlSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.IDBEM, SB.IDPESSOA, SB.DATASLDBEM, SB.MOECODIGO, SB.ID' +
        'SLDCTBBEMXDEP,'
      '       SB.IDGRUPO, SB.IDLOCALIZACAO, SB.IDRESPONSAVEL,'
      '       (SB.VALORG + SB.CMBEM + SB.REAVVALORG + SB.REAVCMBEM +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      '        SB.DEPLANC - SB.CMDEP - SB.REAVDEPLANC - SB.REAVCMDEP -'
      '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP) AS SALDOCONTAB'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC' +
        ','
      '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE SCB1.IDBEM = :IDBEM'
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.IDBEM = :IDBEM'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCB1.IDBEM = DTAMAX.IDBEM'
      '        AND SCB1.IDBEM = SCD1.IDBEM'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA) SB'
      '')
    ClientDataSet = cdsSaldoContabBem
    Left = 232
    Top = 110
  end
end
