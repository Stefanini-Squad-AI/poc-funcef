inherited frmContAporte: TfrmContAporte
  Left = 207
  Top = 182
  BorderIcons = []
  Caption = 'Escolha da Contribuição para o Aporte'
  ClientHeight = 246
  ClientWidth = 369
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 369
    Height = 207
    object Label1: TLabel
      Left = 32
      Top = 156
      Width = 142
      Height = 13
      Caption = 'Contribuição para Aporte'
    end
    object cmbcontrib: TwwDBLookupCombo
      Left = 32
      Top = 174
      Width = 305
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qrycontrib
      LookupField = 'IDCONTRIBUICAO'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 359
      Height = 141
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 7
        Width = 56
        Height = 13
        Caption = 'Participante'
      end
      object Label3: TLabel
        Left = 8
        Top = 51
        Width = 91
        Height = 13
        Caption = 'Plano Prevideciário'
      end
      object Label4: TLabel
        Left = 8
        Top = 94
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblpessoa: TLabel
        Left = 9
        Top = 23
        Width = 336
        Height = 18
        AutoSize = False
        Caption = 'lblpessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lblpatro: TLabel
        Left = 9
        Top = 112
        Width = 336
        Height = 18
        AutoSize = False
        Caption = 'lblpessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lblplano: TLabel
        Left = 9
        Top = 67
        Width = 336
        Height = 18
        AutoSize = False
        Caption = 'lblpessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 207
    Width = 369
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 199
      inherited bbtnSair: TBitBtn
        Hint = 'Sai do tratamento de aporte'
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 31
      DockPos = 31
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        Kind = bkCustom
      end
      inherited bbtnCancelar: TBitBtn
        Hint = 'Cancela o tratamento de aporte corrente'
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = bbtnCancelarClick
        Kind = bkCustom
      end
    end
  end
  object qrycontrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CT.IDCONTRIBUICAO , CT.NOME'
      'FROM CONTRIBUICAO CT , CONTRIBPREVPARTP CP'
      'WHERE CT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND CP.IDPLANOPREV = :IDPLANOPREV'
      'AND CP.IDPESSJUR = :IDPESSJUR'
      'AND CP.IDPESSOA = :IDPESSOA'
      'AND SEQPROPOSTA = :SEQPROPOSTA'
      'AND CP.FLGCOBRA = 1')
    Params.Data = {
      010004000B4944504C414E4F505245560001020030000000094944504553534A
      55520001020030000000084944504553534F4100010200300000000B53455150
      524F504F5354410001020030000000}
    ValidateWithMask = True
    Left = 200
    Top = 120
  end
  object dscontrib: TwwDataSource
    AutoEdit = False
    DataSet = qrycontrib
    Left = 256
    Top = 120
  end
end
