inherited frmCadParamReserva: TfrmCadParamReserva
  Left = 100
  Top = 37
  HelpContext = 160140
  Caption = 'Parâmetros para Contabilização de Alimentação de Reserva'
  ClientHeight = 453
  ClientWidth = 650
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 367
    inherited pnlMestre: TPanel
      Width = 648
      Height = 44
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label2: TLabel
        Left = 299
        Top = 4
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 8
        Top = 19
        Width = 287
        Height = 21
        Color = clBtnFace
        DataField = 'PATROCINADORA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 299
        Top = 19
        Width = 287
        Height = 21
        Color = clBtnFace
        DataField = 'PLANO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 45
      Width = 648
      Height = 321
      Tabs.Strings = (
        'Reservas')
      inherited pgctrlDetalhe: TPageControl
        Width = 550
        Height = 262
        inherited tbsDet: TTabSheet
          Caption = 'Reservas'
          inherited dbgrdDet: TwwDBGrid
            Width = 542
            Height = 234
            Selected.Strings = (
              'CODHIERARQUIA'#9'8'#9'Código'
              'NOME'#9'30'#9'Reserva'
              'PLACONTAD'#9'15'#9'Conta Débito'
              'PLACONTAC'#9'15'#9'Conta Crédito'
              'CODCENTROCUSTOD'#9'10'#9'Centro Custo ~Débito'
              'CODCENTROCUSTOC'#9'10'#9'Centro Custo ~Crédito'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'
              'UNIDNEGOC'#9'10'#9'Atividade/Projeto')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 542
            Height = 234
            object grpDebContab: TGroupBox
              Left = 9
              Top = 39
              Width = 250
              Height = 137
              Caption = 'Conta para Débito'
              TabOrder = 1
              object spdContaContabilD: TSpeedButton
                Left = 224
                Top = 28
                Width = 20
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdContaContabilDClick
              end
              object lblPlaContaD: TLabel
                Left = 4
                Top = 15
                Width = 84
                Height = 13
                Caption = 'Conta Contábil'
              end
              object Label3: TLabel
                Left = 5
                Top = 94
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object edContaContabilD: TMaskEdit
                Left = 4
                Top = 28
                Width = 218
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = edContaContabilDExit
              end
              object cmbCCustoD: TwwDBLookupCombo
                Left = 5
                Top = 109
                Width = 241
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Centro de Custo'#9'F'
                  'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
                DataField = 'CODCENTROCUSTOD'
                DataSource = dsDet
                LookupTable = qryCCustoD
                LookupField = 'CODCENTROCUSTO'
                Options = [loTitles]
                Enabled = False
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object GroupBox4: TGroupBox
                Left = 4
                Top = 52
                Width = 242
                Height = 39
                Caption = 'Descrição da Conta'
                TabOrder = 2
                object lbDescricaoContaD: TLabel
                  Left = 6
                  Top = 17
                  Width = 230
                  Height = 13
                  AutoSize = False
                  Caption = 'lblDescricaoConta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
            end
            object treeContaContabilC: TCMTreeView
              Left = 506
              Top = 230
              Width = 138
              Height = 36
              PodeNavegar = True
              DataSource = dsContaContabilC
              CampoChave = qryContaContabilCPLACONTA
              CampoDescricao = qryContaContabilCPLANOME
              CampoTipo = qryContaContabilCPLATIPO
              OnDblClick = treeContaContabilCDblClick
              OnExit = treeContaContabilCExit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = False
            end
            object grpCreContab: TGroupBox
              Left = 276
              Top = 39
              Width = 250
              Height = 137
              Caption = 'Conta para Crédito'
              TabOrder = 2
              object spdContaContabilC: TSpeedButton
                Left = 225
                Top = 31
                Width = 19
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentFont = False
                OnClick = spdContaContabilCClick
              end
              object lbCcusto1: TLabel
                Left = 5
                Top = 94
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object lbConta1: TLabel
                Left = 5
                Top = 16
                Width = 84
                Height = 13
                Caption = 'Conta Contábil'
              end
              object edContaContabilC: TMaskEdit
                Left = 5
                Top = 30
                Width = 218
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = edContaContabilCExit
              end
              object cmbCCustoC: TwwDBLookupCombo
                Left = 5
                Top = 108
                Width = 241
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Centro de Custo'#9'F'
                  'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
                DataField = 'CODCENTROCUSTOC'
                DataSource = dsDet
                LookupTable = qryCCustoC
                LookupField = 'CODCENTROCUSTO'
                Options = [loTitles]
                Enabled = False
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object grbGrConta1: TGroupBox
                Left = 5
                Top = 54
                Width = 242
                Height = 39
                Caption = 'Descrição da Conta'
                TabOrder = 2
                object lbDescricaoContaC: TLabel
                  Left = 6
                  Top = 17
                  Width = 229
                  Height = 13
                  AutoSize = False
                  Caption = 'lbDescricaoContaC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
            end
            object GroupBox1: TGroupBox
              Left = 9
              Top = -1
              Width = 517
              Height = 40
              Caption = 'Tipo de Reserva'
              TabOrder = 0
              object dblkpcmbReserva: TwwDBLookupCombo
                Left = 9
                Top = 14
                Width = 481
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Reserva'#9'F'
                  'CODHIERARQUIA'#9'8'#9'Código'#9'F')
                DataField = 'IDTIPORESERVA'
                DataSource = dsDet
                LookupTable = qryTipoReserva
                LookupField = 'IDTIPORESERVA'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object GroupBox3: TGroupBox
              Left = 9
              Top = 176
              Width = 517
              Height = 48
              TabOrder = 3
              object Label43: TLabel
                Left = 5
                Top = 9
                Width = 55
                Height = 13
                Caption = 'Subconta'
              end
              object lbAtividade: TLabel
                Left = 272
                Top = 9
                Width = 108
                Height = 13
                Caption = 'Atividade / Projeto'
              end
              object dblkSubconta: TwwDBLookupCombo
                Left = 5
                Top = 24
                Width = 241
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMESUBCONTA'#9'60'#9'SubConta'#9'F')
                DataField = 'CODSUBCONTA'
                DataSource = dsDet
                LookupTable = qrySubConta
                LookupField = 'CODSUBCONTA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object lkcmbDescAtividade: TwwDBLookupCombo
                Left = 272
                Top = 24
                Width = 241
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'UNECODIGO'#9'10'#9'UNECODIGO'#9'F')
                DataField = 'UNIDNEGOC'
                DataSource = dsDet
                LookupTable = qryAtividade
                LookupField = 'UNIDNEGOC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
            object treeContaContabilD: TCMTreeView
              Left = 510
              Top = 235
              Width = 138
              Height = 36
              PodeNavegar = True
              DataSource = dsContaContabilD
              CampoChave = qryContaContabilDPLACONTA
              CampoDescricao = qryContaContabilDPLANOME
              CampoTipo = qryContaContabilDPLATIPO
              OnDblClick = treeContaContabilDDblClick
              OnExit = treeContaContabilDExit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 640
      end
      inherited Dock974: TDock97
        Left = 554
        Height = 262
      end
    end
  end
  inherited Dock972: TDock97
    Width = 650
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 650
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 420
    Top = 1
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 372
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 591
    Top = 65534
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 548
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Patrocinadora e Plano'
    Colunas.Strings = (
      'P.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Patrocinadora'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PLANPREV PL'
      'PLANPREVPATRO PLP')
    CamposChave.Strings = (
      'PLP.IDPESSJUR'
      'PLP.IDPLANOPREV')
    Filtro.Strings = (
      'P.IDPESSOA = PLP.IDPESSJUR'
      'PL.IDPLANOPREV = PLP.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    Left = 650
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 461
    Top = 65531
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
    Top = 4
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV, PL.NOME,  PL.NOME AS PLAN' +
        'O, P.NOME AS PATROCINADORA'
      'FROM PESSOA P, PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE PLP.IDPESSJUR = :IDPESSJUR'
      'AND PLP.IDPLANOPREV = :IDPLANOPREV'
      'AND P.IDPESSOA = PLP.IDPESSJUR'
      'AND PL.IDPLANOPREV = PLP.IDPLANOPREV'
      ' ')
    Left = 510
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 323
    Top = 4
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCONTABRESERVA'
      'set'
      '   IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTOC = :CODCENTROCUSTOC,'
      '  CODCENTROCUSTOD = :CODCENTROCUSTOD,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  PLANO = :PLANO,'
      '  PLACONTAC = :PLACONTAC,'
      '  PLACONTAD = :PLACONTAD'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA')
    InsertSQL.Strings = (
      'insert into PARAMCONTABRESERVA'
      
        '  (IDPESSJUR, IDPLANOPREV, IDTIPORESERVA, IDEMPRESA, CODCENTROCU' +
        'STOC, CODCENTROCUSTOD, '
      '   CODSUBCONTA, UNIDNEGOC, PLANO, PLACONTAC, PLACONTAD)'
      'values'
      
        '  (:IDPESSJUR, :IDPLANOPREV, :IDTIPORESERVA, :IDEMPRESA, :CODCEN' +
        'TROCUSTOC, '
      
        '   :CODCENTROCUSTOD, :CODSUBCONTA, :UNIDNEGOC, :PLANO, :PLACONTA' +
        'C, :PLACONTAD)')
    DeleteSQL.Strings = (
      'delete from PARAMCONTABRESERVA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA')
    Left = 558
    Top = 67
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSJUR, P.IDPLANOPREV, P.IDTIPORESERVA, P.IDEMPRESA,'
      
        '       P.CODCENTROCUSTOC, P.CODCENTROCUSTOD, P.CODSUBCONTA, P.UN' +
        'IDNEGOC,'
      
        '       P.PLANO, P.PLACONTAC, P.PLACONTAD, RP.CODHIERARQUIA, RP.N' +
        'OME '
      'FROM   PARAMCONTABRESERVA P, RESERVAXPLANO RP'
      'WHERE  P.IDPESSJUR      = :IDPESSJUR'
      'AND    P.IDPLANOPREV    = :IDPLANOPREV'
      'AND    RP.IDPLANOPREV   = P.IDPLANOPREV'
      'AND    RP.IDTIPORESERVA = P.IDTIPORESERVA'
      'ORDER BY RP.CODHIERARQUIA'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 504
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryCCustoC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME'
      'FROM   CENTCUST'
      'WHERE  CODCENTROCUSTO IN ( SELECT CODCENTROCUSTO'
      '                           FROM   CONTASxCC'
      '                           WHERE  IDEMPRESA = :IDEMPRESA'
      '                           AND    PLANO     = :PLANO'
      '                           AND    PLACONTA  = :PLACONTA )')
    ValidateWithMask = True
    Left = 721
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
  end
  object qryCCustoD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME'
      'FROM   CENTCUST'
      'WHERE  CODCENTROCUSTO IN ( SELECT CODCENTROCUSTO'
      '                           FROM   CONTASxCC'
      '                           WHERE  IDEMPRESA = :IDEMPRESA'
      '                           AND    PLANO     = :PLANO'
      '                           AND    PLACONTA  = :PLACONTA )')
    ValidateWithMask = True
    Left = 724
    Top = 44
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
  end
  object qryContaContabilD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE  PLANO = :PLANO')
    ValidateWithMask = True
    Left = 721
    Top = 89
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilDPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabilDPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilDPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
  end
  object dsContaContabilD: TwwDataSource
    DataSet = qryContaContabilD
    Left = 721
    Top = 133
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA'
      'FROM   SUBCONTA'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 721
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryAtividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC,IDPESSOA,NOME,IDUSUARIO,UNETIPO,UNECODIGO'
      'FROM   UNIDNEGOCIO'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 721
    Top = 222
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsContaContabilC: TwwDataSource
    DataSet = qryContaContabilC
    Left = 721
    Top = 267
  end
  object qryContaContabilC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE  PLANO = :PLANO')
    ValidateWithMask = True
    Left = 721
    Top = 311
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilCPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryContaContabilCPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'BASEDADOS.PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilCPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'BASEDADOS.PLANOCONTA.PLATIPO'
      FixedChar = True
      Size = 1
    end
    object qryContaContabilCPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'BASEDADOS.PLANOCONTA.PLACCUST'
      FixedChar = True
      Size = 1
    end
  end
  object qryTipoReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.IDTIPORESERVA, RP.CODHIERARQUIA, RP.NOME'
      'FROM   RESERVAXPLANO  RP'
      'WHERE RP.IDPLANOPREV = :IDPLANOPREV'
      'AND RP.ANALITICOSINTETI = '#39'A'#39
      'ORDER BY RP.CODHIERARQUIA')
    ValidateWithMask = True
    Left = 640
    Top = 310
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
