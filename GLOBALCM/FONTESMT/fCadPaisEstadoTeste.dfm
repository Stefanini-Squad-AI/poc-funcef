inherited frmCadPaisEstadoTeste: TfrmCadPaisEstadoTeste
  Caption = 'frmCadPaisEstadoTeste'
  ClientHeight = 484
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 398
    inherited pnlMestre: TPanel
      Width = 515
      Height = 64
      object Label1: TLabel
        Left = 32
        Top = 8
        Width = 65
        Height = 13
        Caption = 'NOMEPAIS'
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 32
        Top = 24
        Width = 214
        Height = 21
        DataField = 'NOMEPAIS'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 65
      Width = 515
      Height = 332
      Tabs.Strings = (
        'Complemento'
        'Estado')
      detdbGrids.Strings = (
        ''
        'dbgEstado')
      inherited pgctrlDetalhe: TPageControl
        Width = 417
        Height = 273
        ActivePage = TabSheet1
        inherited tbsDet: TTabSheet
          Caption = 'Complemento'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 409
            Height = 245
            Selected.Strings = (
              'CODESTADO'#9'3'#9'UF'
              'NOMEESTADO'#9'30'#9'Estado')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 409
            Height = 245
            object Label2: TLabel
              Left = 24
              Top = 24
              Width = 137
              Height = 13
              Caption = 'NOMENACIONALIDADE'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 24
              Top = 64
              Width = 136
              Height = 13
              Caption = 'CODRECEITAFEDERAL'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 24
              Top = 104
              Width = 127
              Height = 13
              Caption = 'CODINTERNACIONAL'
              FocusControl = DBEdit4
            end
            object Label5: TLabel
              Left = 24
              Top = 144
              Width = 116
              Height = 13
              Caption = 'MASCARACPOSTAL'
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 24
              Top = 184
              Width = 74
              Height = 13
              Caption = 'CODREGIAO'
              FocusControl = DBEdit6
            end
            object DBEdit2: TDBEdit
              Left = 24
              Top = 40
              Width = 214
              Height = 21
              DataField = 'NOMENACIONALIDADE'
              DataSource = ds
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 24
              Top = 80
              Width = 74
              Height = 21
              DataField = 'CODRECEITAFEDERAL'
              DataSource = ds
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 24
              Top = 120
              Width = 25
              Height = 21
              DataField = 'CODINTERNACIONAL'
              DataSource = ds
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 24
              Top = 160
              Width = 144
              Height = 21
              DataField = 'MASCARACPOSTAL'
              DataSource = ds
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 24
              Top = 200
              Width = 74
              Height = 21
              DataField = 'CODREGIAO'
              DataSource = ds
              TabOrder = 4
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Estado'
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 409
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label7: TLabel
              Left = 24
              Top = 48
              Width = 77
              Height = 13
              Caption = 'CODESTADO'
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 24
              Top = 88
              Width = 87
              Height = 13
              Caption = 'NOMEESTADO'
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 24
              Top = 128
              Width = 101
              Height = 13
              Caption = 'CODJURISDICAO'
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 24
              Top = 168
              Width = 69
              Height = 13
              Caption = 'CODFISCAL'
              FocusControl = DBEdit10
            end
            object DBEdit7: TDBEdit
              Left = 24
              Top = 64
              Width = 33
              Height = 21
              DataField = 'CODESTADO'
              DataSource = dsDet
              TabOrder = 0
            end
            object DBEdit8: TDBEdit
              Left = 24
              Top = 104
              Width = 214
              Height = 21
              DataField = 'NOMEESTADO'
              DataSource = dsDet
              TabOrder = 1
            end
            object DBEdit9: TDBEdit
              Left = 24
              Top = 144
              Width = 18
              Height = 21
              DataField = 'CODJURISDICAO'
              DataSource = dsDet
              TabOrder = 2
            end
            object DBEdit10: TDBEdit
              Left = 24
              Top = 184
              Width = 74
              Height = 21
              DataField = 'CODFISCAL'
              DataSource = dsDet
              TabOrder = 3
            end
          end
          object dbgEstado: TwwDBGrid
            Left = 0
            Top = 0
            Width = 409
            Height = 245
            Selected.Strings = (
              'CODESTADO'#9'3'#9'UF'
              'NOMEESTADO'#9'30'#9'Estado')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnTitleButtonClick = dbgEstadoTitleButtonClick
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 507
      end
      inherited Dock974: TDock97
        Left = 421
        Height = 273
      end
    end
  end
  inherited Dock972: TDock97
    Width = 517
  end
  inherited Dock971: TDock97
    Top = 445
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 345
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PAIS.NOMEPAIS'
      'PAIS.NOMENACIONALIDADE')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'País'
      'Nacionalidade')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PAIS')
    CamposChave.Strings = (
      'PAIS.IDPAIS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1')
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsEstado
  end
  object cdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 112
  end
end
