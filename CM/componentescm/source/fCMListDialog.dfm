object FrmCMListDialog: TFrmCMListDialog
  Left = 343
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Seleciona Diretorios'
  ClientHeight = 337
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 330
    Height = 284
    Shape = bsFrame
  end
  object LblMessage: TLabel
    Left = 17
    Top = 16
    Width = 163
    Height = 13
    Caption = 'Lista Ordenada de Diretórios'
  end
  object BtnDown: TSpeedButton
    Left = 305
    Top = 120
    Width = 23
    Height = 24
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    OnClick = BtnDownClick
  end
  object BtnUp: TSpeedButton
    Left = 305
    Top = 90
    Width = 23
    Height = 24
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    OnClick = BtnUpClick
  end
  object BtnOpenDlg: TSpeedButton
    Left = 278
    Top = 224
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = BtnOpenDlgClick
  end
  object LbPath: TListBox
    Left = 17
    Top = 32
    Width = 281
    Height = 185
    ItemHeight = 13
    TabOrder = 0
    OnClick = LbPathClick
    OnMouseMove = LbPathMouseMove
  end
  object EdtSelPath: TEdit
    Left = 19
    Top = 224
    Width = 258
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = EdtSelPathChange
  end
  object BtnAlterarPath: TButton
    Left = 17
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = BtnAlterarPathClick
  end
  object BtnAdicionarPath: TButton
    Left = 109
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = BtnAdicionarPathClick
  end
  object BtnExcluirPath: TButton
    Left = 201
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = BtnExcluirPathClick
  end
  object BtnOk: TBitBtn
    Left = 185
    Top = 304
    Width = 75
    Height = 25
    Action = ActOk
    Caption = 'Ok'
    TabOrder = 5
  end
  object BtnCancelar: TBitBtn
    Left = 265
    Top = 304
    Width = 75
    Height = 25
    Action = ActCancelar
    Caption = 'Cancelar'
    TabOrder = 6
  end
  object FindDir: TProcuraDirDlg
    Caption = 'Seleciona Diretório'
    Directory = 
      ': TObject; Shift: TShiftState; X,'#13#10'      Y: Integer);'#13#10'    proce' +
      'dure EdtSelPathChange(Sender: TObject);'#13#10'    procedure FormShow(' +
      'Sender: TObject);'#13#10'  private'#13#10'    procedure BuildList;'#13#10'    { Pr' +
      'ivate declarations }'#13#10'  public'#13#10'    aCmListDialog: TCMListDialog' +
      ';'#13#10' '
    Folder = foCustom
    ShowPath = False
    Left = 304
    Top = 160
  end
  object ActSelPath: TActionList
    Left = 104
    Top = 80
    object ActOk: TAction
      Caption = 'Ok'
      OnExecute = ActOkExecute
      OnUpdate = ActOkUpdate
    end
    object ActCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = ActCancelarExecute
    end
  end
  object DlgFile: TOpenDialog
    Filter = 'Todos os Arquivos|*.*'
    Left = 304
    Top = 216
  end
end
