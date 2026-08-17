inherited frmIncRubrica: TfrmIncRubrica
  Left = 136
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Inclusão Coletiva de Benefício'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            Caption = 'Tipo de Contrato'
            inherited cbxCandidatos: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited gbxSituacao: TGroupBox
            inherited cbxDemitidos: TCheckBox
              Enabled = False
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 445
      DockPos = 453
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 198
      DockPos = 206
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 275
  end
  inherited ds: TwwDataSource
    Top = 275
  end
  inherited tblCargo: TwwQuery
    Left = 515
    Top = 275
  end
  inherited tblSindic: TwwQuery
    Left = 467
    Top = 275
  end
  inherited tblProfis: TwwQuery
    Left = 422
    Top = 274
  end
  inherited tblPessoal: TwwQuery
    Left = 99
    Top = 275
  end
  inherited tblEstab: TwwQuery
    Left = 208
    Top = 275
  end
  inherited tblLotacao: TwwQuery
    Left = 155
    Top = 275
  end
  inherited qryGrauInstr: TwwQuery
    Left = 367
    Top = 274
  end
  inherited qryRamo: TwwQuery
    Left = 255
    Top = 275
  end
  inherited qryMotivo: TwwQuery
    Left = 307
    Top = 274
  end
  inherited qryParamRH: TwwQuery
    Left = 565
    Top = 275
  end
  object qryProxSeq: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 460
    Top = 112
  end
  object qryHstRub: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryHstRubBeforeInsert
    AfterInsert = qryHstRubAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  RUBRICAINDIV'
      'ORDER BY'
      '  IDPESSOA, IDEMPRESA, IDRUBRICA')
    UpdateObject = updHstRub
    ValidateWithMask = True
    Left = 339
    Top = 99
  end
  object updHstRub: TUpdateSQL
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      '  (IDPESSOA, IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS, '
      'SEQRUBRICAINDIV, IDFAVORECIDO, '
      '   IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, '
      'PARCELAS, '
      '   FLGTPRUBMANUT)'
      'values'
      '  (:IDPESSOA, :IDEMPRESA, :IDRUBRICA, :NUMOCORRENCIAS, '
      ':SEQRUBRICAINDIV, '
      
        '   :IDFAVORECIDO, :IDREGRACALCULO, :VALORRUBRICA, :ANOMESINICIO,' +
        ' '
      ':FLGPERMANENTE, '
      '   :PARCELAS, :FLGTPRUBMANUT)')
    Left = 339
    Top = 86
  end
end
