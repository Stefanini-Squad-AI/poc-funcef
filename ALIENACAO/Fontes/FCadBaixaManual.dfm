inherited frmCadBaixaManual: TfrmCadBaixaManual
  Left = 385
  Top = 78
  HelpContext = 1350007
  Caption = 'Lançamento de Baixa de Parcelas Manual'
  ClientHeight = 418
  ClientWidth = 592
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 145
    Width = 592
    Height = 234
    inherited dbGrd: TwwDBGrid [0]
      Width = 590
      Height = 232
      Selected.Strings = (
        'NUMPARCELA'#9'7'#9'Parcela'
        'DATAVENCIMENTO'#9'11'#9'Data de ~Vencimento'
        'CAL_TIPO'#9'15'#9'Tipo de ~Parcela'
        'VLRPRESTACAO'#9'15'#9'Valor da ~Prestação'
        'DATAPAGAMENTO'#9'11'#9'Data de ~Pagamento'
        'VLRPAGO'#9'15'#9'Valor ~Pago'
        'DATALIMITE'#9'11'#9'Data ~Limite'
        'VLRCORRIGIDOATRASO'#9'15'#9'Valor ~Corrigido'
        'VLRMULTAATRASO'#9'15'#9'Multa por ~Atraso'
        'VLRMORAATRASO'#9'15'#9'Mora por ~Atraso')
      TitleAlignment = taCenter
      TitleLines = 2
      OnCalcCellColors = dbGrdCalcCellColors
      OnTopRowChanged = dbGrdTopRowChanged
    end
    inherited pnlControles: TPanel [1]
      Width = 590
      Height = 232
      object Label3: TLabel
        Left = 207
        Top = 64
        Width = 113
        Height = 13
        Caption = 'Data de Pagamento'
      end
      object Label4: TLabel
        Left = 207
        Top = 112
        Width = 63
        Height = 13
        Caption = 'Valor Pago'
      end
      object Label7: TLabel
        Left = 16
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Parcela'
      end
      object Label8: TLabel
        Left = 96
        Top = 8
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object Label9: TLabel
        Left = 16
        Top = 64
        Width = 116
        Height = 13
        Caption = 'Data de Vencimento'
      end
      object Label10: TLabel
        Left = 16
        Top = 112
        Width = 109
        Height = 13
        Caption = 'Valor da Prestação'
      end
      object edDataPag: TCMDateTimePicker
        Left = 207
        Top = 80
        Width = 136
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAPAGAMENTO'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object edVlrPag: TDBRealEdit
        Left = 207
        Top = 128
        Width = 132
        Height = 21
        Alignment = taRightJustify
        DragKind = dkDock
        Lines.Strings = (
          '0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPAGO'
        DataSource = ds
      end
      object DBRealEdit1: TDBRealEdit
        Left = 16
        Top = 24
        Width = 66
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        DragKind = dkDock
        Enabled = False
        Lines.Strings = (
          '0')
        TabOrder = 2
        WordWrap = False
        IntDigits = 4
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMPARCELA'
        DataSource = ds
      end
      object CMDateTimePicker1: TCMDateTimePicker
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAVENCIMENTO'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        Enabled = False
        ShowButton = False
        TabOrder = 3
      end
      object DBRealEdit2: TDBRealEdit
        Left = 16
        Top = 128
        Width = 121
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        DragKind = dkDock
        Enabled = False
        Lines.Strings = (
          '0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPRESTACAO'
        DataSource = ds
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 24
        Width = 246
        Height = 21
        TabStop = False
        DataField = 'CAL_TIPO'
        DataSource = ds
        Enabled = False
        TabOrder = 5
      end
    end
  end
  inherited Dock972: TDock97
    Width = 592
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 25
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 105
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 85
        Width = 20
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 592
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 47
    Width = 592
    Height = 98
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    object Label1: TLabel
      Left = 12
      Top = 46
      Width = 61
      Height = 13
      Caption = 'Comprador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 324
      Top = 46
      Width = 139
      Height = 13
      Caption = 'Condição de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 12
      Top = 6
      Width = 85
      Height = 13
      Caption = 'Nº do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 147
      Top = 6
      Width = 103
      Height = 13
      Caption = 'Nome do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtComprador: TEdit
      Left = 12
      Top = 61
      Width = 301
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object dblcCondPag: TCMDBLookupCombo
      Left = 324
      Top = 61
      Width = 253
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DSCCOND'#9'34'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
      LookupTable = qryCondPag
      LookupField = 'DSCCOND'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCondPagCloseUp
    end
    object edtNumProp: TEdit
      Left = 12
      Top = 21
      Width = 133
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtNomProp: TEdit
      Left = 145
      Top = 21
      Width = 432
      Height = 21
      Enabled = False
      TabOrder = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 6
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 379
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  VLRPAGO = :VLRPAGO,'
      '  DATAPAGAMENTO = :DATAPAGAMENTO,'
      '  FLGTIPOLANC = :FLGTIPOLANC,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA,'
      '  FLGCONCILIADO = :FLGCONCILIADO,'
      '  DATALIMITE = :DATALIMITE,'
      '  VLRCORRIGIDOATRASO = :VLRCORRIGIDOATRASO,'
      '  VLRMULTAATRASO = :VLRMULTAATRASO,'
      '  VLRMORAATRASO = :VLRMORAATRASO,'
      '  VLRPRESTCORRIG = :VLRPRESTCORRIG,'
      '  VLRMULTACORRIG = :VLRMULTACORRIG,'
      '  VLRJUROSCORRIG = :VLRJUROSCORRIG'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      '  (IDCONDPAGIMOVEL, VLRPAGO, '
      '   DATAPAGAMENTO, FLGTIPOLANC, FLGLANCINTEGRA, FLGCONCILIADO, '
      'DATALIMITE, '
      '   VLRCORRIGIDOATRASO, VLRMULTAATRASO, VLRMORAATRASO, '
      'VLRPRESTCORRIG, VLRMULTACORRIG, '
      '   VLRJUROSCORRIG)'
      'values'
      '  (:IDCONDPAGIMOVEL,:VLRPAGO, '
      
        '   :DATAPAGAMENTO, :FLGTIPOLANC, :FLGLANCINTEGRA, :FLGCONCILIADO' +
        ', '
      ':DATALIMITE, '
      '   :VLRCORRIGIDOATRASO, :VLRMULTAATRASO, :VLRMORAATRASO, '
      ':VLRPRESTCORRIG, '
      '   :VLRMULTACORRIG, :VLRJUROSCORRIG)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 419
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO'
      'CONTRATOIMOVEL.CONDATAASSINATURA'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Nr. do Contrato'
      'Nome do Contrato'
      'Data da Proposta'
      'Data do Contrato'
      'Comprador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL'
      'PESSOA')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'PESSOA.RAZAOSOCIAL')
    Filtro.Strings = (
      'CONTRATOIMOVEL.IDLOCATARIO = PESSOA.IDPESSOA'
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'C'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '18'
      '18'
      '60')
    Left = 501
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 460
    Top = 6
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     DECODE(PF.NUMPARCELA,0,NULL,PF.NUMPARCELA) AS NUMPARCELA,'
      '     PF.DATAVENCIMENTO,'
      '     PF.VLRPRESTACAO,'
      '     PF.VLRPAGO,'
      '     PF.DATAPAGAMENTO,'
      '     PF.FLGTIPOLANC,'
      '     PF.FLGLANCINTEGRA,'
      '     PF.FLGCONCILIADO,'
      '     PF.DATALIMITE,'
      '     PF.VLRCORRIGIDOATRASO,'
      '     PF.VLRMULTAATRASO,'
      '     PF.VLRMORAATRASO,'
      '     PF.VLRPRESTCORRIG,'
      '     PF.VLRMULTACORRIG,'
      '     PF.VLRJUROSCORRIG,'
      ''
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.IDCIDADES,'
      '     CI.IDPAIS,'
      '     CI.CODESTADO,'
      ''
      '     CD.IDDOCDIVERGE'
      ''
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      '     CONTRATOIMOVEL CI,'
      '     CONCILIADOC    CD'
      ''
      'WHERE'
      '      (PF.FLGTIPOLANC IN(2,3,5,6,7,9) )'
      '  AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '  AND (PF.IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL)'
      '  AND (CD.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      ''
      'ORDER BY PF.DATAVENCIMENTO, PF.NUMPARCELA'
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
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 338
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
    object qryNUMPARCELA: TStringField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'NUMPARCELA'
      Size = 40
    end
    object qryDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data de ~Vencimento'
      DisplayWidth = 11
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryCAL_TIPO: TStringField
      DisplayLabel = 'Tipo de ~Parcela'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor da ~Prestação'
      DisplayWidth = 15
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Data de ~Pagamento'
      DisplayWidth = 11
      FieldName = 'DATAPAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryVLRPAGO: TFloatField
      DisplayLabel = 'Valor ~Pago'
      DisplayWidth = 15
      FieldName = 'VLRPAGO'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryDATALIMITE: TDateTimeField
      DisplayLabel = 'Data ~Limite'
      DisplayWidth = 11
      FieldName = 'DATALIMITE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVLRCORRIGIDOATRASO: TFloatField
      DisplayLabel = 'Valor ~Corrigido'
      DisplayWidth = 15
      FieldName = 'VLRCORRIGIDOATRASO'
      DisplayFormat = '###,##0.00'
    end
    object qryVLRMULTAATRASO: TFloatField
      DisplayLabel = 'Multa por ~Atraso'
      DisplayWidth = 15
      FieldName = 'VLRMULTAATRASO'
      DisplayFormat = '###,##0.00'
    end
    object qryVLRMORAATRASO: TFloatField
      DisplayLabel = 'Mora por ~Atraso'
      DisplayWidth = 15
      FieldName = 'VLRMORAATRASO'
      DisplayFormat = '###,##0.00'
    end
    object qryIDDOCDIVERGE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCDIVERGE'
      Visible = False
    end
    object qryIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
      Visible = False
    end
    object qryIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object qryIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Visible = False
    end
    object qryCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryFLGCONCILIADO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONCILIADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVLRPRESTCORRIG: TFloatField
      FieldName = 'VLRPRESTCORRIG'
      Visible = False
    end
    object qryVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
      Visible = False
    end
    object qryVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
      Visible = False
    end
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       DECODE(NVL(CP.VLRFINANC,0),0,'
      
        '          DECODE(CP.TIPOCONDPAG,'#39'S'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  Sinal'#39'),'
      
        '                                '#39'V'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  A Vista'#39'),'
      
        '                                    (TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  '#39' || TO_CHAR(CP.NUMPARCELAS,'#39'999'#39')) ),'
      
        '          DECODE(CP.TIPOCONDPAG,'#39'S'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  Sinal'#39'),'
      
        '                                '#39'V'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  A Vista'#39'),'
      
        '                                    (TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  '#39' || TO_CHAR(CP.NUMPARCELAS,'#39'999'#39')) ) ) AS DSCCOND'
      ''
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI'
      'WHERE'
      '      (CP.TIPOCONDPAG IN ('#39'S'#39','#39'P'#39','#39'V'#39','#39'R'#39') )'
      '  AND (CP.IDREPACTUA IS NULL)'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 498
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagDSCCOND: TStringField
      DisplayLabel = 'Vencimento    Valor Finaciado   Nr. Parcelas'
      DisplayWidth = 34
      FieldName = 'DSCCOND'
      Size = 34
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
  end
end
