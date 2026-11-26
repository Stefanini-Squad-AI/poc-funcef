inherited frmCadLayoutDescontoSaida: TfrmCadLayoutDescontoSaida
  Left = 15
  Top = 125
  HelpContext = 180040
  Caption = 'Cadastro de Layout de Arquivos de Saida'
  ClientHeight = 428
  ClientWidth = 762
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 342
    Caption = 'Cadastro de Layout de Arquivos de Saida'
    inherited pnlMestre: TPanel
      Width = 752
      Height = 44
      object Label1: TLabel
        Left = 3
        Top = 1
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedtDescricao: TwwDBEdit
        Left = 3
        Top = 17
        Width = 270
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 49
      Width = 752
      Height = 288
      Tabs.Strings = (
        'Modelo')
      inherited pgctrlDetalhe: TPageControl
        Width = 731
        Height = 229
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 723
            Height = 201
          end
          inherited pnlControlesDet: TPanel
            Width = 723
            Height = 201
            object panel1: TPanel
              Left = 0
              Top = 0
              Width = 723
              Height = 59
              Align = alTop
              TabOrder = 0
              object gbxrubricas: TGroupBox
                Left = 1
                Top = 1
                Width = 133
                Height = 57
                Align = alLeft
                Caption = 'Matricula'
                TabOrder = 0
                object Label7: TLabel
                  Left = 8
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label11: TLabel
                  Left = 68
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoMatricula: TwwDBEdit
                  Left = 8
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLMATRICULA'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamMatricula: TwwDBEdit
                  Left = 68
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMMATRICULA'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox1: TGroupBox
                Left = 134
                Top = 1
                Width = 134
                Height = 57
                Align = alLeft
                Caption = 'Nº de Inscrição'
                TabOrder = 1
                object Label2: TLabel
                  Left = 8
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label3: TLabel
                  Left = 68
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtposicaoinscricao: TwwDBEdit
                  Left = 8
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLINSCRICAO'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtposicaotamanho: TwwDBEdit
                  Left = 68
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMINSCRICAO'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox6: TGroupBox
                Left = 268
                Top = 1
                Width = 134
                Height = 57
                Align = alLeft
                Caption = 'Nome do Participante'
                TabOrder = 2
                object Label14: TLabel
                  Left = 8
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label15: TLabel
                  Left = 69
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoNome: TwwDBEdit
                  Left = 8
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLNOME'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoNome: TwwDBEdit
                  Left = 69
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMNOME'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox7: TGroupBox
                Left = 402
                Top = 1
                Width = 185
                Height = 57
                Align = alLeft
                Caption = 'Nº Sequencial do Dependente'
                TabOrder = 3
                object Label16: TLabel
                  Left = 10
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label17: TLabel
                  Left = 69
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoSeqDep: TwwDBEdit
                  Left = 8
                  Top = 29
                  Width = 57
                  Height = 21
                  DataField = 'COLSEQDEP'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoSeqDep: TwwDBEdit
                  Left = 69
                  Top = 29
                  Width = 57
                  Height = 21
                  DataField = 'TAMSEQDEP'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox12: TGroupBox
                Left = 587
                Top = 1
                Width = 132
                Height = 57
                Align = alLeft
                Caption = 'Código de Controle'
                TabOrder = 4
                object Label40: TLabel
                  Left = 7
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label41: TLabel
                  Left = 69
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosControle: TwwDBEdit
                  Left = 6
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLCONTROLE'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbEdtTamControle: TwwDBEdit
                  Left = 67
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMCONTROLE'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object Panel2: TPanel
              Left = 0
              Top = 118
              Width = 723
              Height = 59
              Align = alTop
              Caption = 'Panel2'
              TabOrder = 2
              object GroupBox3: TGroupBox
                Left = 1
                Top = 1
                Width = 196
                Height = 57
                Align = alLeft
                Caption = 'Valor Efetivamente Descontado'
                TabOrder = 0
                object Label6: TLabel
                  Left = 10
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label8: TLabel
                  Left = 123
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoValEfet: TwwDBEdit
                  Left = 10
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLVALORDES'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoValEfet: TwwDBEdit
                  Left = 123
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMVALORDES'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox9: TGroupBox
                Left = 514
                Top = 1
                Width = 204
                Height = 57
                Align = alLeft
                Caption = 'Indicador de Excesso de Débito'
                TabOrder = 3
                object Label20: TLabel
                  Left = 11
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label21: TLabel
                  Left = 132
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoExceDebito: TwwDBEdit
                  Left = 11
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLEXCESSO'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoExceDebito: TwwDBEdit
                  Left = 132
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMEXCESSO'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox10: TGroupBox
                Left = 359
                Top = 1
                Width = 155
                Height = 57
                Align = alLeft
                Caption = 'Ano / Mes de Cobrança'
                TabOrder = 2
                object Label22: TLabel
                  Left = 10
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label23: TLabel
                  Left = 82
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object wwDBEdit1: TwwDBEdit
                  Left = 10
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLMESCOB'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object wwDBEdit2: TwwDBEdit
                  Left = 82
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMMESCOB'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox11: TGroupBox
                Left = 197
                Top = 1
                Width = 162
                Height = 57
                Align = alLeft
                Caption = 'Ano / Mes de Referência'
                TabOrder = 1
                object Label24: TLabel
                  Left = 10
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label25: TLabel
                  Left = 88
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object posmesref: TwwDBEdit
                  Left = 10
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLMESREF'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object tammesref: TwwDBEdit
                  Left = 88
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMMESREF'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 59
              Width = 723
              Height = 59
              Align = alTop
              TabOrder = 1
              object GroupBox5: TGroupBox
                Left = 1
                Top = 1
                Width = 134
                Height = 57
                Align = alLeft
                Caption = 'Código da Rubrica'
                TabOrder = 0
                object Label12: TLabel
                  Left = 10
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label13: TLabel
                  Left = 71
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoCODRUBRICA: TwwDBEdit
                  Left = 10
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLRUBRICA'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoRubrica: TwwDBEdit
                  Left = 71
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMRUBRICA'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox8: TGroupBox
                Left = 135
                Top = 1
                Width = 133
                Height = 57
                Align = alLeft
                Caption = 'Nº Seq. da Rubrica'
                TabOrder = 1
                object Label18: TLabel
                  Left = 11
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label19: TLabel
                  Left = 72
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoSeqRubrica: TwwDBEdit
                  Left = 11
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLSEQRUB'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoSeqRubrica: TwwDBEdit
                  Left = 72
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMSEQRUB'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox2: TGroupBox
                Left = 456
                Top = 1
                Width = 130
                Height = 57
                Align = alLeft
                Caption = 'Valor da Rubrica'
                TabOrder = 3
                object Label4: TLabel
                  Left = 8
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label5: TLabel
                  Left = 69
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaovalorRubrica: TwwDBEdit
                  Left = 8
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLVALORRUB'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhovalorrubrica: TwwDBEdit
                  Left = 69
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMVALORRUB'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox4: TGroupBox
                Left = 268
                Top = 1
                Width = 188
                Height = 57
                Align = alLeft
                Caption = 'Diferença do Valor da Rubrica'
                TabOrder = 2
                object Label9: TLabel
                  Left = 12
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object Label10: TLabel
                  Left = 116
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedtPosicaoValDif: TwwDBEdit
                  Left = 12
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLVALORDIF'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtTamanhoValDif: TwwDBEdit
                  Left = 116
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMVALORDIF'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object grbPrazo: TGroupBox
                Left = 586
                Top = 1
                Width = 132
                Height = 57
                Align = alLeft
                Caption = 'Prazo'
                TabOrder = 4
                object lbPosIniPrazo: TLabel
                  Left = 8
                  Top = 15
                  Width = 46
                  Height = 13
                  Caption = 'Posição'
                end
                object lbSizePrazo: TLabel
                  Left = 69
                  Top = 15
                  Width = 53
                  Height = 13
                  Caption = 'Tamanho'
                end
                object dbedSizePrazo: TwwDBEdit
                  Left = 69
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'TAMPRAZO'
                  DataSource = ds
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedPosIniPrazo: TwwDBEdit
                  Left = 8
                  Top = 30
                  Width = 57
                  Height = 21
                  DataField = 'COLPRAZO'
                  DataSource = ds
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 744
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 735
        Width = 13
        Height = 229
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Left = 3
            Width = 2
          end
          inherited bbtnCancelarDet: TBitBtn
            Left = 3
            Width = 2
          end
          inherited bbtnVoltarDet: TBitBtn
            Left = 3
            Width = 2
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 762
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 762
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDLAYOUTSAIDA,'
      '  COLPRAZO,'
      '  TAMPRAZO,'
      '  DESCRICAO,'
      '  COLMATRICULA,'
      '  TAMMATRICULA,'
      '  COLINSCRICAO,'
      '  TAMINSCRICAO,'
      '  COLVALORRUB,'
      '  TAMVALORRUB,'
      '  COLVALORDES,'
      '  TAMVALORDES,'
      '  COLVALORDIF,'
      '  TAMVALORDIF,'
      '  COLRUBRICA,'
      '  TAMRUBRICA,'
      '  COLNOME,'
      '  TAMNOME,'
      '  COLSEQDEP,'
      '  TAMSEQDEP,'
      '  COLSEQRUB,'
      '  TAMSEQRUB,'
      '  COLEXCESSO,'
      '  TAMEXCESSO,'
      '  COLMESREF,'
      '  TAMMESREF,'
      '  COLMESCOB,'
      '  TAMMESCOB,'
      '  COLCONTROLE,'
      '  TAMCONTROLE'
      ''
      'FROM'
      '  LAYOUTDESCONTOSAIDA'
      ''
      'WHERE'
      '  IDLAYOUTSAIDA = :IDLAYOUT'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 353
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryIDLAYOUTSAIDA: TFloatField
      FieldName = 'IDLAYOUTSAIDA'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.IDLAYOUTSAIDA'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.DESCRICAO'
      Size = 30
    end
    object qryCOLMATRICULA: TFloatField
      FieldName = 'COLMATRICULA'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLMATRICULA'
    end
    object qryTAMMATRICULA: TFloatField
      FieldName = 'TAMMATRICULA'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMMATRICULA'
    end
    object qryCOLINSCRICAO: TFloatField
      FieldName = 'COLINSCRICAO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLINSCRICAO'
    end
    object qryTAMINSCRICAO: TFloatField
      FieldName = 'TAMINSCRICAO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMINSCRICAO'
    end
    object qryCOLVALORRUB: TFloatField
      FieldName = 'COLVALORRUB'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLVALORRUB'
    end
    object qryTAMVALORRUB: TFloatField
      FieldName = 'TAMVALORRUB'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMVALORRUB'
    end
    object qryCOLVALORDES: TFloatField
      FieldName = 'COLVALORDES'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLVALORDES'
    end
    object qryTAMVALORDES: TFloatField
      FieldName = 'TAMVALORDES'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMVALORDES'
    end
    object qryCOLVALORDIF: TFloatField
      FieldName = 'COLVALORDIF'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLVALORDIF'
    end
    object qryTAMVALORDIF: TFloatField
      FieldName = 'TAMVALORDIF'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMVALORDIF'
    end
    object qryCOLRUBRICA: TFloatField
      FieldName = 'COLRUBRICA'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLRUBRICA'
    end
    object qryTAMRUBRICA: TFloatField
      FieldName = 'TAMRUBRICA'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMRUBRICA'
    end
    object qryCOLNOME: TFloatField
      FieldName = 'COLNOME'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLNOME'
    end
    object qryTAMNOME: TFloatField
      FieldName = 'TAMNOME'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMNOME'
    end
    object qryCOLSEQDEP: TFloatField
      FieldName = 'COLSEQDEP'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLSEQDEP'
    end
    object qryTAMSEQDEP: TFloatField
      FieldName = 'TAMSEQDEP'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMSEQDEP'
    end
    object qryCOLSEQRUB: TFloatField
      FieldName = 'COLSEQRUB'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLSEQRUB'
    end
    object qryTAMSEQRUB: TFloatField
      FieldName = 'TAMSEQRUB'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMSEQRUB'
    end
    object qryCOLEXCESSO: TFloatField
      FieldName = 'COLEXCESSO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLEXCESSO'
    end
    object qryTAMEXCESSO: TFloatField
      FieldName = 'TAMEXCESSO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMEXCESSO'
    end
    object qryCOLMESREF: TFloatField
      FieldName = 'COLMESREF'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLMESREF'
    end
    object qryTAMMESREF: TFloatField
      FieldName = 'TAMMESREF'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMMESREF'
    end
    object qryCOLMESCOB: TFloatField
      FieldName = 'COLMESCOB'
    end
    object qryTAMMESCOB: TFloatField
      FieldName = 'TAMMESCOB'
    end
    object qryCOLCONTROLE: TFloatField
      FieldName = 'COLCONTROLE'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLCONTROLE'
    end
    object qryTAMCONTROLE: TFloatField
      FieldName = 'TAMCONTROLE'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMCONTROLE'
    end
    object qryCOLPRAZO: TFloatField
      FieldName = 'COLPRAZO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.COLPRAZO'
    end
    object qryTAMPRAZO: TFloatField
      FieldName = 'TAMPRAZO'
      Origin = 'BASEDADOS.LAYOUTDESCONTOSAIDA.TAMPRAZO'
    end
  end
  inherited dsDet: TwwDataSource
    Left = 579
    Top = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTDESCONTOSAIDA'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  COLMATRICULA = :COLMATRICULA,'
      '  TAMMATRICULA = :TAMMATRICULA,'
      '  COLINSCRICAO = :COLINSCRICAO,'
      '  TAMINSCRICAO = :TAMINSCRICAO,'
      '  COLVALORRUB = :COLVALORRUB,'
      '  TAMVALORRUB = :TAMVALORRUB,'
      '  COLVALORDES = :COLVALORDES,'
      '  TAMVALORDES = :TAMVALORDES,'
      '  COLVALORDIF = :COLVALORDIF,'
      '  TAMVALORDIF = :TAMVALORDIF,'
      '  COLRUBRICA = :COLRUBRICA,'
      '  TAMRUBRICA = :TAMRUBRICA,'
      '  COLNOME = :COLNOME,'
      '  TAMNOME = :TAMNOME,'
      '  COLSEQDEP = :COLSEQDEP,'
      '  TAMSEQDEP = :TAMSEQDEP,'
      '  COLSEQRUB = :COLSEQRUB,'
      '  TAMSEQRUB = :TAMSEQRUB,'
      '  COLEXCESSO = :COLEXCESSO,'
      '  TAMEXCESSO = :TAMEXCESSO,'
      '  COLMESREF = :COLMESREF,'
      '  TAMMESREF = :TAMMESREF,'
      '  COLMESCOB = :COLMESCOB,'
      '  TAMMESCOB = :TAMMESCOB,'
      '  COLCONTROLE = :COLCONTROLE,'
      '  TAMCONTROLE = :TAMCONTROLE,'
      '  COLPRAZO = :COLPRAZO,'
      '  TAMPRAZO = :TAMPRAZO'
      'where'
      '  IDLAYOUTSAIDA = :OLD_IDLAYOUTSAIDA')
    InsertSQL.Strings = (
      'insert into LAYOUTDESCONTOSAIDA'
      '  (IDLAYOUTSAIDA, DESCRICAO, COLMATRICULA, TAMMATRICULA, '
      'COLINSCRICAO, '
      '   TAMINSCRICAO, COLVALORRUB, TAMVALORRUB, COLVALORDES, '
      'TAMVALORDES, COLVALORDIF, '
      '   TAMVALORDIF, COLRUBRICA, TAMRUBRICA, COLNOME, TAMNOME, '
      'COLSEQDEP, TAMSEQDEP, '
      '   COLSEQRUB, TAMSEQRUB, COLEXCESSO, TAMEXCESSO, COLMESREF, '
      'TAMMESREF, '
      '   COLMESCOB, TAMMESCOB, COLCONTROLE, TAMCONTROLE, COLPRAZO, '
      'TAMPRAZO)'
      'values'
      '  (:IDLAYOUTSAIDA, :DESCRICAO, :COLMATRICULA, :TAMMATRICULA, '
      ':COLINSCRICAO, '
      '   :TAMINSCRICAO, :COLVALORRUB, :TAMVALORRUB, :COLVALORDES, '
      ':TAMVALORDES, '
      
        '   :COLVALORDIF, :TAMVALORDIF, :COLRUBRICA, :TAMRUBRICA, :COLNOM' +
        'E, '
      ':TAMNOME, '
      '   :COLSEQDEP, :TAMSEQDEP, :COLSEQRUB, :TAMSEQRUB, :COLEXCESSO, '
      ':TAMEXCESSO, '
      
        '   :COLMESREF, :TAMMESREF, :COLMESCOB, :TAMMESCOB, :COLCONTROLE,' +
        ' '
      ':TAMCONTROLE, '
      '   :COLPRAZO, :TAMPRAZO)')
    DeleteSQL.Strings = (
      'delete from LAYOUTDESCONTOSAIDA'
      'where'
      '  IDLAYOUTSAIDA = :OLD_IDLAYOUTSAIDA')
    Left = 410
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LAYOUTDESCONTOSAIDA.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'LAYOUTDESCONTOSAIDA')
    CamposChave.Strings = (
      'LAYOUTDESCONTOSAIDA.IDLAYOUTSAIDA'
      'LAYOUTDESCONTOSAIDA.DESCRICAO'
      'LAYOUTDESCONTOSAIDA.COLMATRICULA'
      'LAYOUTDESCONTOSAIDA.TAMMATRICULA'
      'LAYOUTDESCONTOSAIDA.COLINSCRICAO'
      'LAYOUTDESCONTOSAIDA.TAMINSCRICAO'
      'LAYOUTDESCONTOSAIDA.COLVALORRUB'
      'LAYOUTDESCONTOSAIDA.TAMVALORRUB'
      'LAYOUTDESCONTOSAIDA.COLVALORDES'
      'LAYOUTDESCONTOSAIDA.TAMVALORDES'
      'LAYOUTDESCONTOSAIDA.COLVALORDIF'
      'LAYOUTDESCONTOSAIDA.TAMVALORDIF'
      'LAYOUTDESCONTOSAIDA.COLRUBRICA'
      'LAYOUTDESCONTOSAIDA.TAMRUBRICA'
      'LAYOUTDESCONTOSAIDA.COLNOME'
      'LAYOUTDESCONTOSAIDA.TAMNOME'
      'LAYOUTDESCONTOSAIDA.COLSEQDEP'
      'LAYOUTDESCONTOSAIDA.TAMSEQDEP'
      'LAYOUTDESCONTOSAIDA.COLSEQRUB'
      'LAYOUTDESCONTOSAIDA.TAMSEQRUB'
      'LAYOUTDESCONTOSAIDA.COLEXCESSO'
      'LAYOUTDESCONTOSAIDA.TAMEXCESSO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    Left = 515
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 450
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 700
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 636
    Top = 2
  end
end
