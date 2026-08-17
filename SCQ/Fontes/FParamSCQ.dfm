inherited FrmParamSCQ: TFrmParamSCQ
  Left = 212
  Top = 161
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 218
  ClientWidth = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 384
    Height = 132
    object Label1: TLabel
      Left = 32
      Top = 64
      Width = 300
      Height = 13
      Caption = 'Nº de Avaliçoes para compor a média do Fornecedor'
    end
    object chkZeroUm: TDBCheckBox
      Left = 32
      Top = 32
      Width = 321
      Height = 17
      Caption = 'Usar grau da nota de 0 a 1 apenas'
      DataField = 'FLGZEROUM'
      DataSource = ds
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edNumAvali: TDBRealEdit
      Left = 32
      Top = 80
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'NUMAVALI'
      DataSource = ds
    end
  end
  inherited Dock971: TDock97
    Top = 179
    Width = 384
    inherited tb97Fundo: TToolbar97
      Left = 214
      DockPos = 214
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 46
      DockPos = 46
    end
  end
  inherited Dock972: TDock97
    Width = 384
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Atualizar'
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
        NumGlyphs = 3
      end
      inherited sbtnAlterar: TToolbarButton97
        Glyph.Data = {00000000}
        NumGlyphs = 1
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited qry: TwwQuery
    Active = True
    SQL.Strings = (
      'SELECT'
      '          IDPESSOA,'
      '          FLGZEROUM,'
      '          NUMAVALI'
      'FROM'
      '          PARAMSCQ'
      'WHERE'
      '         (IDPESSOA = :pIDPESS) ')
    Params.Data = {01000100077049445045535300030400000000000100}
    object qryFLGZEROUM: TStringField
      FieldName = 'FLGZEROUM'
      Origin = 'PARAMSCQ.FLGZEROUM'
      Size = 1
    end
    object qryNUMAVALI: TFloatField
      FieldName = 'NUMAVALI'
      Origin = 'PARAMSCQ.NUMAVALI'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMSCQ.IDPESSOA'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMSCQ'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  FLGZEROUM = :FLGZEROUM,'
      '  NUMAVALI = :NUMAVALI'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMSCQ'
      '  (IDPESSOA, FLGZEROUM, NUMAVALI)'
      'values'
      '  (:IDPESSOA, :FLGZEROUM, :NUMAVALI)')
    DeleteSQL.Strings = (
      'delete from PARAMSCQ'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
  end
inherited CmeCadastro: TCmEventosCadastro
     OnInsert = CmeCadastroInsert
     OnConfirma = CmeCadastroConfirma
  Left = 358
  Top = 58
end
end
