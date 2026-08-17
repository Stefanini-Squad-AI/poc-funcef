inherited FrmSincoPrevAss: TFrmSincoPrevAss
  Left = 192
  Top = 112
  Caption = 'Sincronização com o Previdenciário'
  ClientHeight = 474
  ClientWidth = 750
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 750
    Height = 435
    object dbgSincroniza: TwwDBGrid
      Left = 1
      Top = 1
      Width = 748
      Height = 433
      Selected.Strings = (
        'NOMEPART'#9'37'#9'Nome do Particpante'#9'F'
        'MOTIVO'#9'25'#9'Situação no Previdenciário'#9'F'
        'NOVASITASS'#9'21'#9'Nova Situação Assistencial'#9'F'
        'MATRICULA'#9'13'#9'Matrícula'#9'F'
        'NOMEPATRO'#9'60'#9'Nome da Patrocinadora'#9'F'
        'INSCRICAONUMERO'#9'10'#9'Nº Inscrição'#9'F'
        'DATA'#9'10'#9'Data'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      TabOrder = 0
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
    object memResult: TMemo
      Left = 1
      Top = 1
      Width = 748
      Height = 433
      Align = alClient
      Lines.Strings = (
        'memResult')
      ReadOnly = True
      TabOrder = 2
    end
    object dbcFlgAcao: TwwDBComboBox
      Left = 280
      Top = 120
      Width = 121
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Atualizar Dados'#9'Atualizar Dados'
        'Cancelar Participante'#9'Cancelar Participante'
        'Realizar Preparo'#9'Realizar Preparo')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
      OnExit = dbcFlgAcaoExit
    end
  end
  inherited Dock971: TDock97
    Top = 435
    Width = 750
    inherited tb97Fundo: TToolbar97
      Left = 440
      DockPos = 440
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 165
        Visible = False
      end
      object btnPrint: TBitBtn
        Left = 81
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Salvar'
        Default = True
        TabOrder = 2
        OnClick = btnPrintClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888111111888888888800888888CCCCCC8888888800FF0888887777778888
          8800FFFF088888111111888800FFFFFFF08888CCCCCC8880FFFFFF66F088887F
          FFFF8880FFFF66FFFF08883333338808FF66FFF66F0888C4444480FF7FFFF66F
          FFF088B99999807F8FF66FFF66F08800000080F7F7FFFF66FFFF08CCCCCC880F
          78FF66FFFFFF087777778880F77FFFFFFFF08811111188880F0FF777F00888CC
          CCCC888880077FFF708888777777888888800000088888111111888888888888
          888888CCCCCC888888888888888888777777}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
    Top = 195
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS IDPESSOA,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEPART,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEPATRO,'
      '       '#39'1234567890123'#39' AS MATRICULA,'
      '       0 AS INSCRICAONUMERO,'
      '       '#39'DP'#39' AS FLGINTERNO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS MOTIVO,'
      '       '#39'10/10/1010'#39' AS DATA,'
      '       0 AS FLGACAO,'
      
        '       '#39'Cancelar Participante'#39'                                  ' +
        '      AS NOVASITASS'
      'FROM DUAL'
      'WHERE 1 = 2'
      ' ')
    UpdateObject = upd
    ControlType.Strings = (
      'FLGACAO;CustomEdit;dbcFlgAcao'
      'NOVASITASS;CustomEdit;dbcFlgAcao')
    ValidateWithMask = True
    Left = 480
    Top = 32
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 528
    Top = 32
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOMEPART = :NOMEPART,'
      '  NOMEPATRO = :NOMEPATRO,'
      '  MATRICULA = :MATRICULA,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  MOTIVO = :MOTIVO,'
      '  DATA = :DATA,'
      '  FLGACAO = :FLGACAO,'
      '  NOVASITASS = :NOVASITASS,'
      '  FLGINTERNO = :FLGINTERNO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDPESSOA, NOMEPART, NOMEPATRO, MATRICULA, INSCRICAONUMERO, MO' +
        'TIVO, DATA,'
      '   FLGACAO, NOVASITASS, FLGINTERNO)'
      'values'
      
        '  (:IDPESSOA, :NOMEPART, :NOMEPATRO, :MATRICULA, :INSCRICAONUMER' +
        'O, :MOTIVO,'
      '   :DATA, :FLGACAO, :NOVASITASS, :FLGINTERNO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 584
    Top = 32
  end
  object qrySitAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOASS, DESCRICAO, FLGINTERNO'
      'FROM SITPLANOASS'
      'WHERE FLGINTERNO <> '#39'NO'#39)
    ValidateWithMask = True
    Left = 480
    Top = 104
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 480
    Top = 168
  end
  object qryExe: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 586
    Top = 168
  end
  object savedlg: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'LogSincronização'
    Filter = 'Arquivos de Texto|*.txt|Todos os Arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Salvar Log da Sincronização.'
    Left = 336
    Top = 376
  end
end
