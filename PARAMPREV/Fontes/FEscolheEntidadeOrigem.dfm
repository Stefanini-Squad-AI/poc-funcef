inherited frmEscolheEntidadeOrigem: TfrmEscolheEntidadeOrigem
  Left = 433
  Top = 144
  Caption = 'Escolhe Entidade Origem'
  ClientHeight = 396
  ClientWidth = 757
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 757
    Height = 357
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 755
      Height = 112
      Align = alTop
      TabOrder = 0
      object pnlInfo: TPanel
        Left = 8
        Top = 5
        Width = 742
        Height = 98
        BorderStyle = bsSingle
        TabOrder = 0
        object lblinfoA: TLabel
          Left = 8
          Top = 8
          Width = 328
          Height = 16
          Caption = 'Já existem dados cadastrados com este CNPJ.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblInfoB: TLabel
          Left = 8
          Top = 40
          Width = 531
          Height = 16
          Caption = 
            'Para ultilizar os dados já existentes, escolha um dos itens abai' +
            'xo e tecle OK.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblInfoC: TLabel
          Left = 8
          Top = 56
          Width = 427
          Height = 16
          Caption = 'Para criar uma nova entidade com este CNPJ, tecle Cancelar.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object DBGridDados: TwwDBGrid
      Left = 1
      Top = 113
      Width = 755
      Height = 243
      Selected.Strings = (
        'CNPJ'#9'14'#9'CNPJ'
        'NOME'#9'50'#9'NOME'
        'CNPBSUSEP'#9'20'#9'CNPB/SUSEP')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsCNPJ
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 357
    Width = 757
    inherited tb97Fundo: TToolbar97
      Left = 575
      DockPos = 575
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 406
      DockPos = 406
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 491
    Top = 203
  end
  object dsCNPJ: TDataSource
    DataSet = frmCadEntidadeOrigem.qryCNPJ
    Left = 272
    Top = 168
  end
end
