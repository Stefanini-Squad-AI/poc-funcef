inherited frmCadClasse: TfrmCadClasse
  Left = 131
  Top = 157
  HelpContext = 740007
  Caption = 'Cadastro de Classes Salariais por Grupo'
  ClientHeight = 341
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 255
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 513
      Height = 47
      object Label1: TLabel
        Left = 11
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label10: TLabel
        Left = 93
        Top = 5
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedMat: TwwDBEdit
        Left = 11
        Top = 20
        Width = 71
        Height = 21
        Color = clGray
        DataField = 'CODGRPFUNC'
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
        Left = 93
        Top = 20
        Width = 404
        Height = 21
        Color = clGray
        DataField = 'DESCGRPFUNC'
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
      Left = 2
      Top = 49
      Width = 513
      Height = 204
      Tabs.Strings = (
        'Classes')
      inherited pgctrlDetalhe: TPageControl
        Width = 415
        Height = 145
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 407
            Height = 117
            Selected.Strings = (
              'MINIMO'#9'10'#9'Pontuação Mínima'
              'MAXIMO'#9'10'#9'Pontuação Máxima'
              'IDFAIXASALARIAL'#9'10'#9'Código da Faixa Salarial')
            Font.Style = []
            ParentFont = False
            TitleFont.Color = clBlack
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 407
            Height = 117
            object Label2: TLabel
              Left = 77
              Top = 28
              Width = 107
              Height = 13
              Caption = 'Pontuação Mínima'
              FocusControl = dbedMinimo
            end
            object Label3: TLabel
              Left = 221
              Top = 28
              Width = 108
              Height = 13
              Caption = 'Pontuação Máxima'
              FocusControl = dbedMaximo
            end
            object Label4: TLabel
              Left = 77
              Top = 79
              Width = 77
              Height = 13
              Caption = 'Faixa Salarial'
              FocusControl = dblcFaixa
            end
            object dbedMinimo: TDBEdit
              Left = 77
              Top = 43
              Width = 94
              Height = 21
              DataField = 'MINIMO'
              DataSource = dsDet
              TabOrder = 0
            end
            object dbedMaximo: TDBEdit
              Left = 221
              Top = 43
              Width = 94
              Height = 21
              DataField = 'MAXIMO'
              DataSource = dsDet
              TabOrder = 1
            end
            object dblcFaixa: TwwDBLookupCombo
              Left = 77
              Top = 93
              Width = 94
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDFAIXASALARIAL'#9'10'#9'Código'
                'STEP1'#9'10'#9'STEP1'
                'STEP2'#9'10'#9'STEP2'
                'STEP3'#9'10'#9'STEP3'
                'STEP4'#9'10'#9'STEP4'
                'STEP5'#9'10'#9'STEP5'
                'STEP6'#9'10'#9'STEP6'
                'STEP7'#9'10'#9'STEP7'
                'STEP8'#9'10'#9'STEP8'
                'STEP9'#9'10'#9'STEP9'
                'DATAEFETIV'#9'10'#9'Data da Efet.')
              DataField = 'IDFAIXASALARIAL'
              DataSource = dsDet
              LookupTable = CdsFaixa
              LookupField = 'IDFAIXASALARIAL'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 505
      end
      inherited Dock974: TDock97
        Left = 419
        Height = 145
      end
    end
  end
  inherited Dock972: TDock97
    Width = 517
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnFaixas: TToolbarButton97
        Left = 260
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Atualizar as Faixas dos Cargos deste Grupo'
        Caption = '&Faixas'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Layout = blGlyphTop
        NumGlyphs = 3
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnFaixasClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 20
      end
    end
  end
  inherited Dock971: TDock97
    Top = 302
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 345
      DockPos = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
      DockPos = 238
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 469
    Top = 29
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 469
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 449
    Top = 107
  end
  inherited Cds: TCMClientDataSet
    Left = 322
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos Funcionais'
    Colunas.Strings = (
      'CODGRPFUNC'
      'DESCGRPFUNC')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'GRUPFUNC')
    CamposChave.Strings = (
      'CODGRPFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 469
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 449
    Top = 93
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 420
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 385
    Top = 1
  end
  object CdsFaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 450
    Top = 252
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 450
    Top = 238
  end
end
