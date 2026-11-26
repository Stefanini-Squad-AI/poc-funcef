inherited frmPRelCartasBanco: TfrmPRelCartasBanco
  Left = 98
  Top = 157
  HelpContext = 180103
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relatório de Cartas para Banco'
  ClientHeight = 304
  ClientWidth = 588
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 588
    Height = 265
    object pnlVersoes: TPanel
      Left = 1
      Top = 1
      Width = 586
      Height = 124
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblVersoes: TLabel
        Left = 2
        Top = 2
        Width = 582
        Height = 13
        Align = alTop
        Caption = 'Versão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ChkLstVersao: TCheckListBox
        Left = 2
        Top = 23
        Width = 582
        Height = 99
        OnClickCheck = ChkLstVersaoClickCheck
        Align = alBottom
        ItemHeight = 13
        TabOrder = 0
        OnExit = ChkLstVersaoExit
      end
    end
    object pnlNumCarta: TPanel
      Left = 1
      Top = 125
      Width = 586
      Height = 139
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object lblNumCarta: TLabel
        Left = 5
        Top = 100
        Width = 96
        Height = 13
        Caption = 'Número da Carta'
      end
      object edtNumCarta: TEdit
        Left = 107
        Top = 96
        Width = 120
        Height = 21
        TabOrder = 1
      end
      object grpBanco: TGroupBox
        Left = 4
        Top = 20
        Width = 570
        Height = 58
        Caption = ' Selecione o Portador Forma de Pagamento '
        TabOrder = 0
        object dblkPortadorPadrao: TwwDBLookupCombo
          Left = 13
          Top = 22
          Width = 468
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição')
          LookupTable = qryPortador
          LookupField = 'CODPORTFORMA'
          Enabled = False
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 265
    Width = 588
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 387
    Top = 27
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM HSTFOLHABENEF'
      'WHERE FLGESTADO <> 2'
      'ORDER BY IDHSTFOLHABENEF DESC')
    ValidateWithMask = True
    Left = 229
    Top = 69
  end
  object qryPortador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DISTINCT HS.CODPORTFORMA,'
      '  P.DESCRICAO'
      'FROM HISTRUBSAL HS, PORTADORFORMA P'
      'WHERE (HS.IDHSTFOLHABENEF = -1)'
      'AND   (HS.CODPORTFORMA    = P.CODPORTFORMA)'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 24
  end
end
