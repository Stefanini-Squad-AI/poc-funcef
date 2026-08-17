inherited FrmReplicaPatro: TFrmReplicaPatro
  Left = 258
  Top = 142
  Caption = 'Replicação'
  ClientHeight = 350
  ClientWidth = 343
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 343
    Height = 311
    object LblPatro: TLabel
      Left = 5
      Top = 17
      Width = 333
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Replica os Relacionamentos de'
      WordWrap = True
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 333
      Height = 12
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 5
      Top = 30
      Width = 333
      Height = 12
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 5
      Top = 42
      Width = 333
      Height = 264
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 2
      object TreePatro: TfcTreeView
        Left = 2
        Top = 2
        Width = 329
        Height = 260
        Align = alClient
        Indent = 35
        Options = [tvoExpandOnDblClk, tvoHideSelection, tvoShowButtons, tvoShowLines, tvoToolTips]
        Items.StreamVersion = 1
        Items.Data = {00000000}
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 311
    Width = 343
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 315
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 254
    Top = 56
    object qryPatrocinadoraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PATRO.IDPESSOA'
    end
    object qryPatrocinadoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
end
