inherited frmCadMsgBoletoMT: TfrmCadMsgBoletoMT
  Left = 204
  Top = 182
  Caption = 'Mensagens Padrão para Boletos Bancários'
  ClientHeight = 380
  ClientWidth = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 547
    Height = 294
    inherited dbGrd: TwwDBGrid [0]
      Width = 545
      Height = 292
      Selected.Strings = (
        'MSGDESCRICAO'#9'72'#9'Descrição da Mensagem')
    end
    inherited pnlControles: TPanel [1]
      Width = 545
      Height = 292
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 140
        Height = 13
        Caption = 'Descrição da Mensagem'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 58
        Width = 505
        Height = 3
        Shape = bsTopLine
      end
      object Label2: TLabel
        Left = 16
        Top = 76
        Width = 47
        Height = 13
        Caption = 'Linha 1:'
      end
      object Label3: TLabel
        Left = 16
        Top = 97
        Width = 47
        Height = 13
        Caption = 'Linha 2:'
      end
      object Label4: TLabel
        Left = 16
        Top = 118
        Width = 47
        Height = 13
        Caption = 'Linha 3:'
      end
      object Label5: TLabel
        Left = 16
        Top = 139
        Width = 47
        Height = 13
        Caption = 'Linha 4:'
      end
      object Label6: TLabel
        Left = 16
        Top = 160
        Width = 47
        Height = 13
        Caption = 'Linha 5:'
      end
      object Label7: TLabel
        Left = 16
        Top = 181
        Width = 47
        Height = 13
        Caption = 'Linha 6:'
      end
      object Label8: TLabel
        Left = 16
        Top = 202
        Width = 47
        Height = 13
        Caption = 'Linha 7:'
      end
      object Label9: TLabel
        Left = 16
        Top = 223
        Width = 47
        Height = 13
        Caption = 'Linha 8:'
      end
      object Label10: TLabel
        Left = 16
        Top = 244
        Width = 47
        Height = 13
        Caption = 'Linha 9:'
      end
      object Bevel3: TBevel
        Left = 14
        Top = 279
        Width = 507
        Height = 3
        Shape = bsTopLine
      end
      object dbedDescricao: TDBEdit
        Left = 16
        Top = 24
        Width = 505
        Height = 21
        DataField = 'MSGDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBedtLinha1: TDBEdit
        Left = 72
        Top = 72
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_1'
        DataSource = ds
        TabOrder = 1
      end
      object DBedtLinha2: TDBEdit
        Left = 72
        Top = 93
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_2'
        DataSource = ds
        TabOrder = 2
      end
      object DBedtLinha3: TDBEdit
        Left = 72
        Top = 114
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_3'
        DataSource = ds
        TabOrder = 3
      end
      object DBedtLinha4: TDBEdit
        Left = 72
        Top = 135
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_4'
        DataSource = ds
        TabOrder = 4
      end
      object DBedtLinha5: TDBEdit
        Left = 72
        Top = 156
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_5'
        DataSource = ds
        TabOrder = 5
      end
      object DBedtLinha6: TDBEdit
        Left = 72
        Top = 177
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_6'
        DataSource = ds
        TabOrder = 6
      end
      object DBedtLinha7: TDBEdit
        Left = 72
        Top = 198
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_7'
        DataSource = ds
        TabOrder = 7
      end
      object DBedtLinha8: TDBEdit
        Left = 72
        Top = 219
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_8'
        DataSource = ds
        TabOrder = 8
      end
      object DBedtLinha9: TDBEdit
        Left = 72
        Top = 240
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_9'
        DataSource = ds
        TabOrder = 9
      end
    end
  end
  inherited Dock972: TDock97
    Width = 547
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Width = 29
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 547
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    object CdsIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object CdsIDMSGBOLETO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMSGBOLETO'
      Visible = False
    end
    object CdsMSGDESCRICAO: TStringField
      DisplayLabel = 'Descrição da Mensagem'
      DisplayWidth = 72
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object CdsTEXTOLINHA_1: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_1'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_2: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_2'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_3: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_3'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_4: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_4'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_5: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_5'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_6: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_6'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_7: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_7'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_8: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_8'
      Visible = False
      Size = 69
    end
    object CdsTEXTOLINHA_9: TStringField
      DisplayWidth = 69
      FieldName = 'TEXTOLINHA_9'
      Visible = False
      Size = 69
    end
  end
end
