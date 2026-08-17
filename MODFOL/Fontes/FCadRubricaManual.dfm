inherited frmCadRubricaManual: TfrmCadRubricaManual
  Left = 98
  Top = 119
  Caption = 'Lançamento Manual de Histórico de Rubricas'
  ClientHeight = 421
  ClientWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 670
    Height = 335
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 662
      Height = 39
      object Label1: TLabel
        Left = 146
        Top = 13
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 7
        Top = 13
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object dbtxtSituacao: TDBText
        Left = 580
        Top = 11
        Width = 74
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 67
        Top = 10
        Width = 73
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 184
        Top = 10
        Width = 390
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 43
      Width = 662
      Height = 288
      Tabs.Strings = (
        'Rubricas')
      inherited pgctrlDetalhe: TPageControl
        Width = 564
        Height = 229
        inherited tbsDet: TTabSheet
          Caption = 'Rubricas'
          inherited dbgrdDet: TwwDBGrid
            Width = 556
            Height = 201
            Selected.Strings = (
              'MES'#9'8'#9'Mês de Referência'
              'MESCOBRANCA'#9'8'#9'Mês de Cob./Pag.'
              'CODPROVDESC'#9'10'#9'Código'
              'DESCRPROVDESC'#9'40'#9'Rubrica'
              'VALORPROVENTO'#9'13'#9'Valor (R$)')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 556
            Height = 201
            object Label8: TLabel
              Left = 32
              Top = 114
              Width = 45
              Height = 13
              Caption = 'Rubrica'
            end
            object Label9: TLabel
              Left = 400
              Top = 57
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label3: TLabel
              Left = 32
              Top = 162
              Width = 79
              Height = 13
              Caption = 'Tipo de Folha'
            end
            object Label4: TLabel
              Left = 400
              Top = 114
              Width = 63
              Height = 13
              Caption = 'Referência'
            end
            object dblkpcmbRubrica: TwwDBLookupCombo
              Left = 32
              Top = 128
              Width = 339
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRPROVDESC'#9'130'#9'Rubrica'
                'CODPROVDESC'#9'7'#9'Código')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = qryProvDesc
              LookupField = 'IDRUBRICA'
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblcMotivo: TwwDBLookupCombo
              Left = 32
              Top = 175
              Width = 339
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsDet
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbedRefer: TwwDBEdit
              Left = 400
              Top = 128
              Width = 121
              Height = 21
              DataField = 'REFERENCIA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedValor: TDBRealEdit
              Left = 400
              Top = 70
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VALORPROVENTO'
              DataSource = dsDet
            end
            object grpMesInicio: TGroupBox
              Left = 32
              Top = 4
              Width = 300
              Height = 45
              Caption = 'Ano e Mês de Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label7: TLabel
                Left = 9
                Top = 18
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object Label10: TLabel
                Left = 176
                Top = 18
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object cmbMesRef: TComboBox
                Left = 39
                Top = 15
                Width = 114
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro'
                  'Outubro'
                  'Novembro'
                  'Dezembro')
              end
              object spnedAnoRef: TSpinEdit
                Left = 209
                Top = 15
                Width = 68
                Height = 22
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 1950
              end
            end
            object GroupBox1: TGroupBox
              Left = 32
              Top = 60
              Width = 300
              Height = 45
              Caption = 'Ano e Mês de Cobrança / Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object Label11: TLabel
                Left = 9
                Top = 18
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object Label12: TLabel
                Left = 176
                Top = 18
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object cmbMesCob: TComboBox
                Left = 39
                Top = 15
                Width = 114
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro'
                  'Outubro'
                  'Novembro'
                  'Dezembro')
              end
              object spnedAnoCob: TSpinEdit
                Left = 209
                Top = 15
                Width = 68
                Height = 22
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 1950
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 654
      end
      inherited Dock974: TDock97
        Left = 568
        Height = 229
      end
    end
  end
  inherited Dock972: TDock97
    Width = 670
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 288
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        ParentShowHint = False
        Visible = False
      end
      object sbtnElimHistRubSal: TToolbarButton97
        Left = 180
        Top = 0
        Width = 108
        Height = 41
        Hint = 'Exclusão Seletiva ou Global  de Histórico de Rubricas'
        AllowAllUp = True
        Caption = '&Exclusão Global'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnApagarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 670
    inherited tb97Fundo: TToolbar97
      Left = 501
      DockPos = 502
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 334
      DockPos = 335
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  P.IDPESSOA, ('#39'  '#39' || P.NOME) AS NOME, F.MATRICULA, F.IDEMPRESA' +
        ', ST.TIPOSIT,'
      
        '  DECODE(ST.TIPOSIT,'#39'A'#39','#39'(Ativ'#39', '#39'F'#39','#39'(Afastad'#39', '#39'D'#39','#39'(Demitid'#39')' +
        ' ||'
      '    DECODE(PEFIS.SEXO,'#39'F'#39','#39'a)'#39','#39'o)'#39') AS SITUACAO'
      'FROM'
      '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (F.IDPESSOA  = :IDPESSOA)      AND'
      '  (F.IDPESSOA  = P.IDPESSOA)     AND'
      '  (F.IDPESSOA  = PEFIS.IDPESSOA) AND'
      '  (F.IDSITFUNC = ST.IDSITFUNC)')
    Left = 378
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 575
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 350
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Lançamento Manual de Histórico de Rubricas'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOAFISICA'
      'FUNCIONARIO'
      'SITFUNC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'SITFUNC.IDSITFUNC     = FUNCIONARIO.IDSITFUNC'
      'FUNCIONARIO.IDPESSOA  = PESSOAFISICA.IDPESSOA'
      'PESSOAFISICA.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    Left = 454
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 161
    Top = 74
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  H.IDPESSOA, H.IDPESSJUR, H.IDMOTIVO, H.IDMODULO, H.MES, H.MESC' +
        'OBRANCA, H.REFERENCIA,'
      
        '  H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO, H.SEQRUBRICA, RP.' +
        'DESCRPROVDESC'
      'FROM'
      '  HISTRUBSAL H, RUBRICAXPESS RP'
      'WHERE'
      '  (H.IDPESSOA  = :IDPESSOA) AND'
      '  (H.IDMODULO  = 21)        AND'
      '  (H.IDRUBRICA = RP.IDRUBRICA)  AND'
      '  (H.IDPESSJUR= RP.IDPESSOA) '
      'ORDER BY'
      '  H.CODPROVDESC, H.MES DESC')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 544
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetMES: TStringField
      DisplayLabel = 'Mês de Referência'
      DisplayWidth = 8
      FieldName = 'MES'
      Origin = 'HISTRUBSAL.MES'
      Size = 7
    end
    object qryDetMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de Cob./Pag.'
      DisplayWidth = 8
      FieldName = 'MESCOBRANCA'
      Origin = 'HISTRUBSAL.MESCOBRANCA'
      Size = 7
    end
    object qryDetCODPROVDESC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODPROVDESC'
      Origin = 'HISTRUBSAL.CODPROVDESC'
      Size = 15
    end
    object qryDetDESCRPROVDESC: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 40
      FieldName = 'DESCRPROVDESC'
      Origin = 'RUBRICAXPESS.DESCRPROVDESC'
      Size = 130
    end
    object qryDetVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor (R$)'
      DisplayWidth = 13
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'HISTRUBSAL.IDPESSOA'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'HISTRUBSAL.IDPESSJUR'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVO'
      Origin = 'HISTRUBSAL.IDMOTIVO'
      Visible = False
    end
    object qryDetREFERENCIA: TStringField
      DisplayWidth = 10
      FieldName = 'REFERENCIA'
      Origin = 'HISTRUBSAL.REFERENCIA'
      Visible = False
      Size = 10
    end
    object qryDetIDRUBRICA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
      Origin = 'HISTRUBSAL.IDRUBRICA'
      Visible = False
    end
    object qryDetSEQRUBRICA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQRUBRICA'
      Origin = 'HISTRUBSAL.SEQRUBRICA'
      Visible = False
    end
    object qryDetIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'HISTRUBSAL.IDMODULO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTRUBSAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDMODULO = :IDMODULO,'
      '  MES = :MES,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  REFERENCIA = :REFERENCIA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  SEQRUBRICA = :SEQRUBRICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDMODULO = :OLD_IDMODULO and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    InsertSQL.Strings = (
      'insert into HISTRUBSAL'
      '  (IDPESSOA, IDPESSJUR, IDMOTIVO, IDMODULO, MES, MESCOBRANCA, '
      'REFERENCIA, '
      '   IDRUBRICA, CODPROVDESC, VALORPROVENTO, SEQRUBRICA)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :IDMOTIVO, :IDMODULO, :MES, :MESCOBRAN' +
        'CA, '
      ':REFERENCIA, '
      '   :IDRUBRICA, :CODPROVDESC, :VALORPROVENTO, :SEQRUBRICA)')
    DeleteSQL.Strings = (
      'delete from HISTRUBSAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDMODULO = :OLD_IDMODULO and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    Left = 510
    Top = 1
  end
  object qryProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RP.IDRUBRICA, RP.CODPROVDESC, RP.DESCRPROVDESC'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RP.IDPESSOA   = :IDEMPRESA) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (PD.IDPROVENTO = RP.IDRUBRICA)'
      'ORDER BY'
      '  UPPER(DESCRPROVDESC)')
    ValidateWithMask = True
    Left = 601
    Top = 289
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO '
      'WHERE'
      '  (GRUPOMOTIVO IN ('#39'F'#39','#39'D'#39'))'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 605
    Top = 241
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, NORMALINI'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 624
    Top = 2
  end
end
