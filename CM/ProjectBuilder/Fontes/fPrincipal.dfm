object FrmPrincipal: TFrmPrincipal
  Left = 106
  Top = 56
  BorderStyle = bsSingle
  Caption = 'CM Project Builder 5.00.02'
  ClientHeight = 472
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PgPBuilder: TPageControl
    Left = 0
    Top = 0
    Width = 558
    Height = 472
    ActivePage = TbsCompilacao
    Align = alClient
    TabOrder = 0
    object TbsArquivos: TTabSheet
      Caption = 'Arquivos'
      ImageIndex = 2
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 57
        Height = 13
        Caption = 'Packages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 236
        Width = 95
        Height = 13
        Caption = 'Sistemas Padr„o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PnlCtrls: TPanel
        Left = 8
        Top = 22
        Width = 535
        Height = 28
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Caption = 'PnlCtrls'
        TabOrder = 0
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 535
          Height = 28
          Align = alClient
          Caption = 'ToolBar1'
          Images = ImlListaPkg
          TabOrder = 0
          object BtnInserir: TToolButton
            Left = 0
            Top = 2
            Action = AclInserir
            ParentShowHint = False
            ShowHint = True
          end
          object BtnExclui: TToolButton
            Left = 23
            Top = 2
            Action = AclExcuir
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton3: TToolButton
            Left = 46
            Top = 2
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object BtnDown: TToolButton
            Left = 54
            Top = 2
            Action = AclMoveDown
            ParentShowHint = False
            ShowHint = True
          end
          object BtnUp: TToolButton
            Left = 77
            Top = 2
            Action = AclMoveUp
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton2: TToolButton
            Left = 100
            Top = 2
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object BtnMarcarTodos: TToolButton
            Left = 108
            Top = 2
            Action = ActMarcarTodos
            ParentShowHint = False
            ShowHint = True
          end
          object BtnInverterSele: TToolButton
            Left = 131
            Top = 2
            Action = ActInverterSelecao
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton6: TToolButton
            Left = 154
            Top = 2
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object ToolButton1: TToolButton
            Left = 162
            Top = 2
            Action = ActSave
          end
        end
      end
      object GrdModulo: TwwDBGrid
        Left = 8
        Top = 281
        Width = 535
        Height = 153
        Selected.Strings = (
          'COMPILADO'#9'2'#9'Ok'#9'F'
          'NOMEMODULO'#9'40'#9'Nome MÛdulo'#9'F'
          'VERSAO'#9'10'#9'Vers„o'#9'F'
          'FLGGRUPODESENV'#9'4'#9'Grupo'#9'F'
          'DPL'#9'3'#9'Bpl'#9'F'
          'IDMODULO'#9'5'#9'IdModulo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DsModulo
        KeyOptions = []
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
        ImageList = ImlListaPkg
      end
      object Panel1: TPanel
        Left = 10
        Top = 254
        Width = 535
        Height = 28
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Caption = 'PnlCtrls'
        TabOrder = 2
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 535
          Height = 28
          Align = alClient
          Caption = 'ToolBar1'
          Images = ImlListaPkg
          TabOrder = 0
          object BtnSelAll: TToolButton
            Left = 0
            Top = 2
            Hint = 'Marcar Todos Os Projetos'
            Caption = 'ActMarcarTodos'
            ImageIndex = 6
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnSelAllClick
          end
          object BtnInvSel: TToolButton
            Left = 23
            Top = 2
            Hint = 'Inverter SeleÁ„o'
            Caption = 'ActInverterSelecao'
            ImageIndex = 7
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnInvSelClick
          end
          object ToolButton16: TToolButton
            Left = 46
            Top = 2
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 7
            Style = tbsSeparator
          end
          object BtnRefresh: TToolButton
            Left = 54
            Top = 2
            Action = ActRefresh
          end
        end
      end
      object PgPackage: TPageControl
        Left = 7
        Top = 48
        Width = 535
        Height = 184
        ActivePage = TbsObj
        TabOrder = 3
        object TbsPadroes: TTabSheet
          Caption = 'Padr„o'
          object LvPackages: TListView
            Left = 0
            Top = 0
            Width = 527
            Height = 156
            Align = alClient
            Checkboxes = True
            Columns = <
              item
                Caption = 'Dpl'
                Width = 150
              end
              item
                Caption = 'Vers„o'
                Width = 100
              end
              item
                Caption = 'Path'
                Width = 300
              end>
            SmallImages = ImlListaPkg
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TbsObj: TTabSheet
          Caption = 'Objetos de NegÛcio'
          ImageIndex = 1
          object LstvObj: TListView
            Left = 0
            Top = 0
            Width = 527
            Height = 156
            Align = alClient
            Checkboxes = True
            Columns = <
              item
                Caption = 'Dpl'
                Width = 150
              end
              item
                Caption = 'Vers„o'
                Width = 100
              end
              item
                Caption = 'Path'
                Width = 300
              end>
            SmallImages = ImlListaPkg
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
    object TbsParametros: TTabSheet
      Caption = 'Par‚metros'
      object Bevel2: TBevel
        Left = 8
        Top = 4
        Width = 537
        Height = 331
      end
      object Bevel1: TBevel
        Left = 8
        Top = 339
        Width = 537
        Height = 95
      end
      object LblPadroesRede: TLabel
        Left = 21
        Top = 57
        Width = 133
        Height = 13
        Caption = 'DiretÛrio Padrıes Rede'
      end
      object LblFontesRede: TLabel
        Left = 21
        Top = 96
        Width = 129
        Height = 13
        Caption = 'DiretÛrio Fontes Rede:'
      end
      object LblPadroesLocal: TLabel
        Left = 21
        Top = 213
        Width = 138
        Height = 13
        Caption = 'DiretÛrio Padrıes Local:'
      end
      object LblFontesLocal: TLabel
        Left = 21
        Top = 252
        Width = 130
        Height = 13
        Caption = 'DiretÛrio Fontes Local:'
      end
      object LblInstRede: TLabel
        Left = 21
        Top = 135
        Width = 156
        Height = 13
        Caption = 'DiretÛrio Instaladores Rede'
      end
      object LblInstLocal: TLabel
        Left = 21
        Top = 291
        Width = 157
        Height = 13
        Caption = 'DiretÛrio Instaladores Local'
      end
      object BtnPadroesRede: TSpeedButton
        Left = 509
        Top = 70
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object BtnFontesRede: TSpeedButton
        Tag = 1
        Left = 509
        Top = 110
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object BtnInstRede: TSpeedButton
        Tag = 2
        Left = 509
        Top = 150
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object Label2: TLabel
        Left = 21
        Top = 14
        Width = 84
        Height = 13
        Caption = 'Vers„o Padr„o'
      end
      object BtnInstLocal: TSpeedButton
        Tag = 5
        Left = 508
        Top = 304
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object BtnFontesLocal: TSpeedButton
        Tag = 4
        Left = 508
        Top = 266
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object BtnPadroesLocal: TSpeedButton
        Tag = 3
        Left = 508
        Top = 226
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object LblExecsRede: TLabel
        Left = 21
        Top = 173
        Width = 156
        Height = 13
        Caption = 'DiretÛrio Execut·veis Rede'
      end
      object SpeedButton1: TSpeedButton
        Tag = 6
        Left = 509
        Top = 188
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF8888888888888FF00000000000008FF0FB7B7B7B7B808F0FB7B7B7B7B
          7808F0F7B7B7B7B7B0080F7B7B7B7B7B80080FFFFFFFFFF80708000000000000
          0B08F0F7B7B7B7B7B708F0FB7B7B7FFFFF08F0F7B7B7F000000FFF0FFFFF0FFF
          FFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnPadroesRedeClick
      end
      object Label7: TLabel
        Left = 285
        Top = 14
        Width = 156
        Height = 13
        Caption = 'Vers„o Objetos de NegÛcio'
      end
      object CkbCompPadroes: TCheckBox
        Left = 17
        Top = 344
        Width = 121
        Height = 26
        Caption = 'Compila Padrıes'
        TabOrder = 0
        OnClick = CkbCompPadroesClick
      end
      object CkbCompilaModulos: TCheckBox
        Tag = 1
        Left = 141
        Top = 344
        Width = 119
        Height = 26
        Caption = 'Compila MÛdulos'
        TabOrder = 1
        OnClick = CkbCompPadroesClick
      end
      object CknGeraBeta: TCheckBox
        Tag = 3
        Left = 141
        Top = 367
        Width = 110
        Height = 26
        Caption = 'Padrıes Beta'
        TabOrder = 2
        OnClick = CkbCompPadroesClick
      end
      object CkbComplFront: TCheckBox
        Tag = 4
        Left = 16
        Top = 367
        Width = 105
        Height = 26
        Caption = 'Compila Front'
        TabOrder = 3
        OnClick = CkbCompPadroesClick
      end
      object CkbLiberaFtp: TCheckBox
        Tag = 2
        Left = 266
        Top = 344
        Width = 128
        Height = 26
        Caption = 'Libera Vers„o FTP'
        TabOrder = 4
        OnClick = CkbCompPadroesClick
      end
      object CkbMensErro: TCheckBox
        Tag = 5
        Left = 266
        Top = 367
        Width = 124
        Height = 26
        Caption = 'Mesagens de Erro'
        TabOrder = 5
        OnClick = CkbCompPadroesClick
      end
      object CkbGeraInst: TCheckBox
        Tag = 6
        Left = 411
        Top = 344
        Width = 125
        Height = 24
        Caption = 'Gera Instaladores'
        TabOrder = 6
        OnClick = CkbCompPadroesClick
      end
      object CkbCopiaInst: TCheckBox
        Tag = 7
        Left = 411
        Top = 367
        Width = 125
        Height = 24
        Caption = 'Copia Instaladores'
        TabOrder = 7
        OnClick = CkbCompPadroesClick
      end
      object EdtPadroesRede: TEditReg
        Left = 21
        Top = 71
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'PadroesRede'
        ReadOnly = True
        TabOrder = 8
      end
      object EdtFontesRede: TEditReg
        Left = 21
        Top = 110
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'FontesRede'
        ReadOnly = True
        TabOrder = 9
      end
      object EdtInstRede: TEditReg
        Left = 21
        Top = 149
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'InstalaRede'
        ReadOnly = True
        TabOrder = 10
      end
      object EdtPadroesLocal: TEditReg
        Left = 21
        Top = 227
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'PadroesLocal'
        ReadOnly = True
        TabOrder = 11
      end
      object EdtFontesLocal: TEditReg
        Left = 21
        Top = 266
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'FontesLocal'
        ReadOnly = True
        TabOrder = 12
      end
      object EdtInstLocal: TEditReg
        Left = 21
        Top = 305
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'InstalaLocal'
        ReadOnly = True
        TabOrder = 13
      end
      object EdtversaoPadrao: TEditReg
        Left = 21
        Top = 30
        Width = 250
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'VersaoDPL'
        TabOrder = 14
      end
      object EdtExecRede: TEditReg
        Left = 21
        Top = 187
        Width = 486
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'ExecsRede'
        ReadOnly = True
        TabOrder = 15
      end
      object CkbAutomatico: TCheckBox
        Left = 16
        Top = 389
        Width = 273
        Height = 17
        Caption = ' Habilita Compilador Autom·tico de Versıes'
        TabOrder = 16
      end
      object CkbSendMail: TCheckBox
        Left = 288
        Top = 389
        Width = 244
        Height = 17
        Caption = 'Enviar e-mail com status da compilaÁ„o'
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
      object CkbCompilaDll: TCheckBox
        Left = 17
        Top = 411
        Width = 151
        Height = 17
        Caption = 'Compila Somente DLL'#39's'
        TabOrder = 18
      end
      object EdtObjNegocio: TEditReg
        Left = 285
        Top = 30
        Width = 250
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'VersaoObjDPL'
        TabOrder = 19
      end
      object CkbCompilaSemPadrao: TCheckBox
        Left = 177
        Top = 410
        Width = 151
        Height = 17
        Caption = 'Compila Sem Padr„o'
        TabOrder = 20
      end
    end
    object TbsCompilacao: TTabSheet
      Caption = 'CompilaÁ„o'
      ImageIndex = 1
      object ReMensCompilador: TRichEdit
        Left = 0
        Top = 96
        Width = 550
        Height = 155
        Align = alTop
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object PnlResOper: TPanel
        Left = 0
        Top = 0
        Width = 550
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = ' Resumo das OperaÁıes'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PnlStatusComp: TPanel
        Left = 0
        Top = 73
        Width = 550
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = '  Aguardando Comando .....'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object PnlDescResOper: TPanel
        Left = 0
        Top = 23
        Width = 550
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object LblCompPadroes: TLabel
          Left = 8
          Top = 9
          Width = 95
          Height = 13
          Caption = 'Compila Padroes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object LblCompModulos: TLabel
          Left = 117
          Top = 9
          Width = 96
          Height = 13
          Caption = 'Compila MÛdulos'
          Transparent = True
        end
        object LblLiberaFtp: TLabel
          Left = 117
          Top = 27
          Width = 106
          Height = 13
          Caption = 'Libera Vers„o FTP'
          Transparent = True
        end
        object LblGeraPadroes: TLabel
          Left = 237
          Top = 9
          Width = 77
          Height = 13
          Caption = 'Padrıes Beta'
          Transparent = True
        end
        object LblCompFront: TLabel
          Left = 8
          Top = 27
          Width = 78
          Height = 13
          Caption = 'Compila Front'
          Transparent = True
        end
        object LblExibeMens: TLabel
          Left = 237
          Top = 27
          Width = 116
          Height = 13
          Caption = 'Menssagens de Erro'
          Transparent = True
        end
        object LblCopiaInstal: TLabel
          Left = 366
          Top = 26
          Width = 68
          Height = 13
          Caption = 'Copia Instal'
          Transparent = True
        end
        object LblGeraInstal: TLabel
          Left = 366
          Top = 8
          Width = 63
          Height = 13
          Caption = 'Gera Instal'
          Transparent = True
        end
        object BtnExecute: TBitBtn
          Left = 443
          Top = 7
          Width = 96
          Height = 35
          Caption = 'Execute'
          TabOrder = 0
          OnClick = BtnExecuteClick
          Glyph.Data = {
            96010000424D9601000000000000760000002800000018000000180000000100
            0400000000002001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777770777777777777777777777770077777777777
            777777777770B077777777777777777777770B077777777777777777700000B0
            7777777777777777770BBBBB0777777777700077770BBB0000777777788FF087
            7770BBB0777777788FFFFF070000BFBF0777778FFFF88F070BFBFB000077778F
            F00F0FF070BFBF07777777700FFF0FF000FBFBF07777700FFFFFF0FF070FBFBF
            077778FFFFFCF0FFF0000000077778FFCCCFFF0FF07777777777778FFFFFCF0F
            887777777777778FFCCCFFF07777777777777778FFFFFCFF0777777777777778
            FFCCCFFFF0777777777777778FFFFFF8877777777777777778FFF88777777777
            7777777777888777777777777777777777777777777777777777}
        end
      end
      object PnlCompl: TPanel
        Left = 0
        Top = 251
        Width = 550
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = ' OperaÁıes ConcluÌdas'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object LblCompl: TListBox
        Left = 0
        Top = 274
        Width = 550
        Height = 72
        Align = alClient
        ItemHeight = 13
        TabOrder = 5
      end
      object PnlErro: TPanel
        Left = 0
        Top = 346
        Width = 550
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = ' Erros'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object LbErro: TListBox
        Left = 0
        Top = 369
        Width = 550
        Height = 75
        Align = alBottom
        ItemHeight = 13
        TabOrder = 7
      end
    end
    object TbsVersoesFuncef: TTabSheet
      Caption = 'Versıes Funcef'
      ImageIndex = 3
      object Label3: TLabel
        Left = 10
        Top = 11
        Width = 245
        Height = 13
        AutoSize = False
        Caption = 'Sistemas Associados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 298
        Top = 11
        Width = 240
        Height = 13
        AutoSize = False
        Caption = 'Sistemas Liberados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 266
        Top = 31
        Width = 23
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFF000000C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          404000404000404000404000404000FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00C0C0C0C0C0C0C0C0C0C0C0C040400000800000800000800000800000800040
          4000FFFFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C0008000008000
          008000008000FFFFFF008000008000008000404000FF0000FFFFFFFFFFFFFFFF
          FF000000C0C0C0C0C0C0008000008000008000008000FFFFFF00800000800000
          8000404000FFFFFFFFFFFFFF0000FFFFFFFFFFFF000000C0C0C0008000008000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000404000FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFF000000008000008000008000008000FFFFFF00800000800000
          8000404000FFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0008000008000
          008000008000FFFFFF008000008000008000404000FFFFFFFFFFFF8080808080
          80C0C0C0C0C0C0C0C0C0C0C0C000800000800000800000800000800000800040
          4000808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          008000008000008000008000008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 266
        Top = 63
        Width = 23
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFF000000C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FF
          FFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          000080000080000080000080000080FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00C0C0C0C0C0C0C0C0C0C0C0C00000800000FF0000FF0000FF0000FF0000FF00
          0080FFFFFFFFFFFFFF0000FFFFFF000000C0C0C0C0C0C0C0C0C00000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF000080FF0000FFFFFFFFFFFFFFFF
          FF000000C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF000080FFFFFFFFFFFFFF0000FFFFFFFFFFFF000000C0C0C00000FF0000FF
          FFFFFFC0C0C0FFFFFFFFFFFFC0C0C00000FF000080FF0000FF0000FFFFFFFFFF
          FFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF000080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C00000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF000080FFFFFFFFFFFF8080808080
          80C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF00
          0080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        OnClick = SpeedButton3Click
      end
      object Label6: TLabel
        Left = 10
        Top = 292
        Width = 529
        Height = 13
        AutoSize = False
        Caption = 'Pasta de Destino'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object SpeedButton4: TSpeedButton
        Left = 515
        Top = 309
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
          B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
          B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
          0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
          55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
          55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
          55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
          5555575FFF755555555557000075555555555577775555555555}
        NumGlyphs = 2
        OnClick = SpeedButton4Click
      end
      object LblProgress: TLabel
        Left = 10
        Top = 378
        Width = 528
        Height = 16
        AutoSize = False
        Caption = 'Aguardando Comando'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 10
        Top = 337
        Width = 399
        Height = 34
      end
      object LbAssoc: TListBox
        Left = 10
        Top = 31
        Width = 247
        Height = 249
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
      end
      object LbLiberado: TListBox
        Left = 296
        Top = 30
        Width = 244
        Height = 250
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
      end
      object BtnTransFere: TBitBtn
        Left = 418
        Top = 337
        Width = 118
        Height = 34
        Caption = 'Transfere'
        TabOrder = 2
        OnClick = BtnTransFereClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008000
          0000000000000000800080800080800080800080800080800080800080800080
          C0C0C0000000000000C0C0C080008000000000FFFF000000800080C0C0C00000
          0000000080008080008080008080008000808000FFFF00000000808000000000
          8080008080000000000000000000008080008080000000800080800080800080
          00808000FFFF000000008080008080008080FFFFFF00000000FFFF0080800080
          8000808000000080008080808000000000000000FFFF00FFFF00000000808000
          8080C0C0C0008080000000008080FFFFFFC0C0C0000000000000000000008080
          008080000000008080FFFFFFFFFFFF00FFFF00FFFFFFFFFF00FFFF00FFFF0080
          80000000008080008080000000008080008080008080FFFFFF00FFFF00000000
          0000000000000000000000C0C0C000FFFF000000008080008080008080FFFFFF
          008080FFFFFF00FFFF808080808080FFFFFF808080808080000000008080FFFF
          FF00FFFFFFFFFF00FFFF008080008080008080008080FFFFFF808080808080FF
          FFFFC0C0C080808000000080808000FFFFC0C0C0000000000000800080800080
          000000008080FFFFFFFFFFFF808080FFFFFF808080808080000000FFFFFF00FF
          FF008080000000800080800080800080008080FFFFFF00FFFF00FFFF808080FF
          FFFFC0C0C0808080000000008080FFFFFF00FFFF000000800080800080800080
          800080008080008080808080808080C0C0C08080808080800000008080800080
          80808080800080800080800080800080800080800080800080800080808080FF
          FFFFFFFFFFC0C0C0000000800080800080800080800080800080800080800080
          8000808000808000808000808000808080808080808080808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080}
      end
      object EdtDestino: TEditReg
        Left = 10
        Top = 309
        Width = 503
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\ProjectBuilder50\Paths'
        RegValueName = 'FontesFuncef'
        ReadOnly = True
        TabOrder = 3
      end
      object MemLog: TMemo
        Left = 11
        Top = 397
        Width = 526
        Height = 40
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object CkbCopyInstal: TCheckBox
        Left = 23
        Top = 346
        Width = 131
        Height = 17
        Caption = 'Copia Instaladores'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CkbVersoes: TCheckBox
        Left = 167
        Top = 346
        Width = 116
        Height = 17
        Caption = 'Copia Versıes'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CkbFontes: TCheckBox
        Left = 294
        Top = 346
        Width = 104
        Height = 17
        Caption = 'Copia Fontes'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
  end
  object TIcon: TTrayIcon
    Active = False
    ShowDesigning = False
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000777777777777700000
      000000000000007F8AA8800008700000000000000000007F8888877778700000
      000000000000007FFFFFFFFFFF70000000000000000000070000000000800000
      000000000001100777777777770000000000000000199107F888888887000000
      0000000001991917F7066667870000000000000019933197F706666787000000
      00000007193BB317F7066667870000000000000193BBBB37F70E666787000000
      0000001993333337F7000007870000000000019111199997F888888887000000
      0000199999999999777777777700000000019999999133333199100000000000
      00199199991BBBBBBB3191000000000007193B333BBBBBBBBBB1991000000000
      7193BBBBBBBBBB33331999100000000019133331111111119999999170000001
      9111999999999999999999911000001999999999999999999999999311000199
      99999999999999999999913B39101911999999999999999999113BBBB3911931
      999999911133333333BBBBBBBB1993B19999933BBBBBBBBBBB333333BBB193B3
      19991BBBBBBBBBBBB31999993B31193B31991BBBBBBBBBBBB399999933190193
      B19991BBBBBBBBBB31919999119000193B3199133BBBB3311993999919000001
      911199991111119999119999900000001111111111111111111111110000FFFF
      E001FFFFC000FFFFC000FFFFC000FFFFC000FFFFE000FFFE6001FFFC2001FFF8
      0001FFF00001FFE00001FFE00001FFC00001FF800001FF000003FE00007FFC00
      003FF800001FF000001FF0000007E0000007C000000380000001000000000000
      000000000000000000000000000080000001C0000003E0000007F000000F}
    OnDblClick = MnuExibirAplicaoClick
    PopupMenu = PpmPrincipal
    Left = 326
    Top = 177
  end
  object PpmPrincipal: TPopupMenu
    Left = 365
    Top = 71
    object MnuApptitle: TMenuItem
      Caption = 'CM Project Builder 5.01.01'
      Default = True
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnuExibirAplicao: TMenuItem
      Caption = 'Exibir AplicaÁ„o'
      OnClick = MnuExibirAplicaoClick
    end
    object MnuMinimizarAplicao: TMenuItem
      Caption = 'Minimizar AplicaÁ„o'
      OnClick = MnuMinimizarAplicaoClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnuBuildAll: TMenuItem
      Caption = 'Build &All'
    end
    object MnuBuildProjects: TMenuItem
      Caption = 'Build &Projects'
    end
    object MnuBuildInstal: TMenuItem
      Caption = 'Build &Instal'
    end
    object LiberaVersoFTP1: TMenuItem
      Caption = '&Libera Vers„o FTP'
    end
    object MnuBackup: TMenuItem
      Caption = '&Backup'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnuSair: TMenuItem
      Caption = '&Sair'
      OnClick = MnuSairClick
    end
  end
  object AppPrincipal: TApplicationEvents
    OnMinimize = AppPrincipalMinimize
    Left = 325
    Top = 127
  end
  object ImlListaPkg: TImageList
    Left = 410
    Top = 71
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F001F00
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00100010001000
      10001F001F000000000000001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001000000000000000
      0000100010001F0010421F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001000000000000000
      00000000000010001F001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001000000000000000
      0000000000001F001F001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001000000000000000
      000000001F001F001F001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00100000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000010001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      0000000000000000000010001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F000000
      0000000000000000000010001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F0010000000
      0000000000000000000010001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F0010421F001000
      1000000000000000000010001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F000000000000001F00
      1F0010001000100010001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F001F001F001F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      10421042104210421042104210421042104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000007C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010021002
      1002100210020000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000104200000000FF7F1863186318631863
      18631863FF7F000000000000000000000000007C007C00000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000010421002100210021002
      1002100210021002100200000000000000000000000000000000E07F1863E07F
      1863E07F1863E07F1863E07F10420000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000007C007C007C0000FF7F18631863
      1863186318631863FF7F000000000000000000001042FF03100210021002FF7F
      FF7FFF7F1002100210021002000000000000000000000000E07F1863E07F1863
      E07F1863E07F1863E07F186310420000104200000000FF7F1863186318631863
      18631863FF7F000000000000000000000000007C007C007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000001042FF03100210021002FF7F
      FF7FFF7F10021002100210020000000000000000000000001863E07F1863E07F
      1863E07F1863E07F1863E07F00000000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000007C007C00000000FF7F18631863
      1863186318631863FF7F00000000000000001042FF031002100210021002FF7F
      FF7FFF7F1002100210021002100200000000000000001863E07F1863E07F1863
      E07F1863E07F1863E07F104200000000104200000000FF7F1863186318631863
      18631863FF7F000000000000000000000000007C000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000000000000000000000000000000000
      00000000000000001042000018630000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000FF7F18631863
      1863186318631863FF7F00000000000000001042FF031002FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10021002000000000000000000000000000000000000
      000000000000000000000000E07F0000104200000000FF7F1863186318631863
      18631863FF7F0000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000001042FF0310021002FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F100210021002000000000000000000000000000000001F00
      00001F0000001F000000000000000000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000FF7F18631863
      1863186318631863FF7F00000000000000001042FF03100210021002FF7FFF7F
      FF7FFF7FFF7F100210021002100200000000000000000000E07F000000000000
      1F0000001F0000001F00000000000000104200000000FF7FFF7FFF7FFF7F1863
      18631863FF7F0000000000001002000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000001042FF03100210021002FF7F
      FF7FFF7F10021002100210020000000000000000000000001863E07F00000000
      00001F0000001F000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000000010021002000000000000000000000000FF7FFF7FFF7F
      FF7F186318631863FF7F000000000000000000001042FF031002100210021002
      FF7F100210021002100210020000000000000000000000000000000000000000
      000000001F00000000000000104200000000000000000000FF7F0000FF7F1863
      18631863FF7F0000100210021002000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000001042FF03FF0310021002
      1002100210021002100200000000000000000000000000000000000000001042
      00000000000000000000104200000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F00001002100210020000000000000000000000000000FF7F0000
      FF7F186318631863FF7F000000000000000000000000000010421042FF03FF03
      FF03FF03FF031042104200000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000010021002000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000001002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07F004200000000000000000000000000000000000000000000
      0000000010421042000000000000000000000000000000000000000000000000
      0000000010421042000000000000000000000000000000000000000010421042
      10421042104200000000000000000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07F004200420000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000001042104210021002
      10021002100210421042000000000000000000000000E07FE07F000000420042
      00420000E07FE07F004200420042000000000000000000000000000000000000
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7F0000000000000000000000000000000010421002100210021002
      10021002100210021002000000000000000000000000E07FE07F000000000000
      00000000E07FE07F0042004200420000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000001042FF031002100210021002
      FF7F1002100210021002100200000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07F004200420042000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F0000000000000000000000001042FF03100210021002FF7F
      FF7FFF7F10021002100210020000000000000000000000000000000000000000
      0000000000000000004200420042000000000000000008010801080108010801
      1F001F00FF7FFF7FFF7F00000000000000000000000000400040004000400040
      1F001F00FF7FFF7FFF7F00000000000000001042FF03100210021002FF7FFF7F
      FF7FFF7FFF7F1002100210021002000000000000000000000000000000000000
      0000000000000000000000420042000000000000080100020002000200020002
      0801FF7FFF7F1F00FF7F000000000000000000000040007C007C007C007C007C
      0040FF7FFF7F1F00FF7F00000000000000001042FF0310021002FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F10021002100200000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000104200000042000000000002000200020002FF7F00020002
      000208011F00FF7FFF7FFF7F000000000000007C007C007C007C007C007C007C
      007C00401F00FF7FFF7FFF7F0000000000001042FF031002FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F1002100200000000000000000000FF7FFF7FFF7FFF7F
      FF7F000000000000000010420000000000000002000200020002FF7F00020002
      00020801FF7FFF7F1F00FF7FFF7F00000000007C007C007C007C007C007C007C
      007C0040FF7FFF7F1F00FF7FFF7F000000001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000000000000010421042104200000000
      00000000FF7FFF7F0000000010420000000000020002FF7FFF7FFF7FFF7FFF7F
      000208011F001F00FF7FFF7FFF7FFF7F0000007C007CFF7F0000FF7FFF7F0000
      007C00401F001F00FF7FFF7FFF7FFF7F00001042FF031002100210021002FF7F
      FF7FFF7F10021002100210021002000000000000000000000000000000000000
      0000FF7FFF7F00000000FF7F0000000000000002000200020002FF7F00020002
      00020801FF7FFF7FFF7FFF7F104210420000007C007C007C007C007C007C007C
      007C0040FF7FFF7FFF7FFF7F10421042000000001042FF03100210021002FF7F
      FF7FFF7F10021002100210020000000000000000000000000000000000000000
      FF7FFF7F00000000FF7FFF7F0000000000000002000200020002FF7F00020002
      00020801FF7FFF7F10421042000000000000007C007C007C007C007C007C007C
      007C0040FF7FFF7F1042104200000000000000001042FF03100210021002FF7F
      FF7FFF7F10021002100210020000000000000000000000000000000000000000
      FF7F00000000FF7FFF7F00001042000000000000000200020002000200020002
      0801104210421042000000000000000000000000007C007C007C007C007C007C
      004010421042104200000000000000000000000000001042FF03FF0310021002
      1002100210021002100200000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000020002000200020002
      00000000000000000000000000000000000000000000007C007C007C007C007C
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF03FF03FF030000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F0FF000000000000E03B000000000000
      CF03000000000000CFC3000000000000CFC3000000000000CF83000000000000
      E7FF000000000000FFFF000000000000FFE7000000000000C1F3000000000000
      C3F3000000000000C3F3000000000000C0F3000000000000DC07000000000000
      FF0F000000000000FFFF000000000000FFFFFFFF801FFFFFF83FE000801F6007
      E00FC000801F2007C007D000801F00078003A000801F00078003A000801F2007
      00014000801F600700017FE0801FE00700010000801FE0070001AD58801FE007
      0001A6AC801BE0078003A3598013E0078003DDB3C003E007C007E0E7E003F007
      E00FFF4FF013F807F83FFF9FFFFBFC07800FFFFFFFFFFFFF8007FF9FFF9FF83F
      8003FE1FFE1FE00F8001F81FF81FC0078001E00FE00F80038001E00FE00F8003
      8001C007C0070001DFE1800780070001C001000300030001C071000100010001
      C089000012000001F713000100018003FA23000700078003FC43801F801FC007
      FE8FC1FFC1FFE00FFE3FFFFFFFFFF83F00000000000000000000000000000000
      000000000000}
  end
  object AclPrincipal: TActionList
    Images = ImlListaPkg
    Left = 371
    Top = 177
    object AclInserir: TAction
      Caption = 'AclInserir'
      Hint = 'Adiciona Package'
      ImageIndex = 1
      OnExecute = AclInserirExecute
      OnUpdate = AclInserirUpdate
    end
    object AclExcuir: TAction
      Caption = 'AclExcuir'
      Hint = 'Exclui Package'
      ImageIndex = 2
      OnExecute = AclExcuirExecute
    end
    object AclMoveDown: TAction
      Caption = 'AclMoveDown'
      Hint = 'Move Para Baixo'
      ImageIndex = 3
      OnExecute = AclMoveDownExecute
    end
    object AclMoveUp: TAction
      Caption = 'AclMoveUp'
      Hint = 'Move Para Cima'
      ImageIndex = 4
      OnExecute = AclMoveUpExecute
    end
    object ActSave: TAction
      Caption = 'ActSave'
      Hint = 'Salva AlteraÁıes'
      ImageIndex = 5
      OnExecute = ActSaveExecute
    end
    object ActMarcarTodos: TAction
      Caption = 'ActMarcarTodos'
      Hint = 'Marcar Todos Os Projetos'
      ImageIndex = 6
      OnExecute = ActMarcarTodosExecute
    end
    object ActInverterSelecao: TAction
      Caption = 'ActInverterSelecao'
      Hint = 'Inverter SeleÁ„o'
      ImageIndex = 7
      OnExecute = ActInverterSelecaoExecute
    end
    object ActRefresh: TAction
      Caption = 'ActRefresh'
      Hint = 'Refresh Consultas'
      ImageIndex = 8
      OnExecute = ActRefreshExecute
    end
  end
  object DlgPkg: TOpenDialog
    Filter = 'Packages|*.Dpk'
    Title = 'Selecione a Dpl para compilaÁ„o'
    Left = 370
    Top = 127
  end
  object DlgPath: TProcuraDirDlg
    Directory = 
      '(è'#22#2#24#0#0#0'Ã›'#27#2#4'˜'#24#2'L'#0#0#0'c:\arquivos de programas\borland\delphi5\Sou' +
      'rce\Vcl\DBCtrls.à'#1#0#0'C'#0#0#0#0#0#0#0'1'#0#0#0'C:\ProjetosCM5\Cm\ProjectBuilder' +
      '\Dcu\Wwcommon.dcu'#0'ct†X'#29#2#24#26#30#2'X'#0#0#0'O'#0#0#0#0#0#0#0'<'#0#0#0'C:\ProjetosCM5\Cm\Co' +
      'mponentesXT\ip2000d5\source\wwDialog.pas '#2#0#0'C'#0#0#0#0#0#0#0'1'#0#0#0'C:\Proje' +
      'tosC'
    Folder = foCustom
    ShowPath = False
    Left = 320
    Top = 71
  end
  object qryModulo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseProjectBuilder'
    SQL.Strings = (
      'SELECT'
      '   IDMODULO,'
      '   NOMEMODULO,'
      '   NOMEPROJETO,'
      '   VERSAO,'
      '   COMPILADO,'
      '   COPIAFONTES,'
      '   DPL,'
      '   FLGGRUPODESENV,'
      '   USURESPONSAVEL,'
      '   GERENTEPROJETO,'
      '   EMAIL,'
      '   EMAILGERENTE   '
      'FROM'
      '   MODULO'
      'WHERE'
      '   (VERSAO <> '#39' '#39') AND'
      '   ((FLGGRUPODESENV <> '#39'C'#39') OR (FLGGRUPODESENV IS NULL))'
      'ORDER BY NOMEMODULO'
      ' ')
    UpdateObject = updModulo
    ControlType.Strings = (
      'COMPILADO;CheckBox;S;N'
      'DPL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 452
    Top = 115
    object qryModuloCOMPILADO: TStringField
      DisplayLabel = 'Ok'
      DisplayWidth = 2
      FieldName = 'COMPILADO'
      Origin = 'MODULO.COMPILADO'
      Size = 1
    end
    object qryModuloNOMEMODULO: TStringField
      DisplayLabel = 'Nome MÛdulo'
      DisplayWidth = 40
      FieldName = 'NOMEMODULO'
      Origin = 'MODULO.NOMEMODULO'
      ReadOnly = True
      Size = 50
    end
    object qryModuloVERSAO: TStringField
      DisplayLabel = 'Vers„o'
      DisplayWidth = 10
      FieldName = 'VERSAO'
      Origin = 'MODULO.VERSAO'
      Size = 10
    end
    object qryModuloFLGGRUPODESENV: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 4
      FieldName = 'FLGGRUPODESENV'
      Origin = 'MODULO.FLGGRUPODESENV'
      ReadOnly = True
      Size = 1
    end
    object qryModuloDPL: TFloatField
      DisplayLabel = 'Bpl'
      DisplayWidth = 3
      FieldName = 'DPL'
      Origin = 'MODULO.DPL'
      ReadOnly = True
    end
    object qryModuloIDMODULO: TFloatField
      DisplayLabel = 'IdModulo'
      DisplayWidth = 5
      FieldName = 'IDMODULO'
      Origin = 'MODULO.IDMODULO'
      ReadOnly = True
    end
    object qryModuloNOMEPROJETO: TStringField
      DisplayLabel = 'Nome Projeto'
      DisplayWidth = 50
      FieldName = 'NOMEPROJETO'
      Origin = 'MODULO.NOMEPROJETO'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object qryModuloCOPIAFONTES: TDateTimeField
      DisplayLabel = 'Copia Fontes'
      DisplayWidth = 18
      FieldName = 'COPIAFONTES'
      Origin = 'MODULO.COPIAFONTES'
      ReadOnly = True
      Visible = False
    end
    object qryModuloUSURESPONSAVEL: TStringField
      DisplayLabel = 'Usu·rio'
      DisplayWidth = 60
      FieldName = 'USURESPONSAVEL'
      Origin = 'MODULO.USURESPONSAVEL'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object qryModuloGERENTEPROJETO: TStringField
      DisplayLabel = 'Gerente'
      DisplayWidth = 60
      FieldName = 'GERENTEPROJETO'
      Origin = 'MODULO.GERENTEPROJETO'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object qryModuloEMAIL: TStringField
      DisplayLabel = 'e-mail'
      DisplayWidth = 60
      FieldName = 'EMAIL'
      Origin = 'MODULO.EMAIL'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object qryModuloEMAILGERENTE: TStringField
      DisplayLabel = 'e-mail Gerente'
      DisplayWidth = 60
      FieldName = 'EMAILGERENTE'
      Origin = 'MODULO.EMAILGERENTE'
      ReadOnly = True
      Visible = False
      Size = 60
    end
  end
  object updModulo: TUpdateSQL
    ModifySQL.Strings = (
      'update MODULO'
      'set'
      '  VERSAO = :VERSAO,'
      '  COMPILADO = :COMPILADO'
      'where'
      '  IDMODULO = :OLD_IDMODULO')
    InsertSQL.Strings = (
      'insert into MODULO'
      '  (VERSAO, COMPILADO)'
      'values'
      '  (:VERSAO, :COMPILADO)')
    DeleteSQL.Strings = (
      'delete from MODULO'
      'where'
      '  IDMODULO = :OLD_IDMODULO')
    Left = 452
    Top = 162
  end
  object dbSAD: TDatabase
    DatabaseName = 'BaseProjectBuilder'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=PREVSEGUR'
      'USER NAME=CMDBA'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=FALSE'
      'PASSWORD=sadanyou')
    SessionName = 'Default'
    Left = 452
    Top = 68
  end
  object DsModulo: TwwDataSource
    DataSet = qryModulo
    Left = 452
    Top = 209
  end
  object ZipExtrFontes: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = [AddDirNames, AddEncrypt]
    ExtrOptions = [ExtrDirNames, ExtrOverWrite]
    SFXOptions = []
    Unattended = False
    Password = '8903pdfus&*{+)F94Tfgd1465_#*#$()'
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    OnProgress = ZipExtrFontesProgress
    Left = 452
    Top = 21
  end
  object QryDirModulo: TwwQuery
    DatabaseName = 'BaseProjectBuilder'
    SQL.Strings = (
      'SELECT'
      '   DIRFONTES, LISTABPL'
      'FROM'
      '   MODULO'
      'WHERE'
      '   IDMODULO = :IDMODULO')
    ValidateWithMask = True
    Left = 452
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
    object QryDirModuloDIRFONTES: TMemoField
      FieldName = 'DIRFONTES'
      Origin = 'BASEPROJECTBUILDER.MODULO.DIRFONTES'
      BlobType = ftMemo
      Size = 2000
    end
    object QryDirModuloLISTABPL: TMemoField
      FieldName = 'LISTABPL'
      Origin = 'BASEPROJECTBUILDER.MODULO.LISTABPL'
      BlobType = ftMemo
      Size = 400
    end
  end
  object TmrCompilacao: TTimer
    Enabled = False
    Interval = 1800000
    OnTimer = TmrCompilacaoTimer
    Left = 324
    Top = 272
  end
  object QryDirBpl: TwwQuery
    DatabaseName = 'BaseProjectBuilder'
    SQL.Strings = (
      'SELECT '
      '   DIRFONTES  '
      'FROM '
      '   MODULO,'
      '( SELECT'
      '   LISTABPL'
      ' FROM'
      '    MODULO'
      ' WHERE'
      '    IDMODULO = :IDMODULO ) QBPL  '
      'WHERE '
      
        '   INSTR(QBPL.LISTABPL,RTRIM(LOWER(NOMEPROJETO)),1) > 0  AND DPL' +
        ' = 1'
      'ORDER BY '
      '   NOMEPROJETO    ')
    ValidateWithMask = True
    Left = 452
    Top = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
    object QryDirBplDIRFONTES: TMemoField
      FieldName = 'DIRFONTES'
      BlobType = ftMemo
      Size = 2000
    end
  end
end
