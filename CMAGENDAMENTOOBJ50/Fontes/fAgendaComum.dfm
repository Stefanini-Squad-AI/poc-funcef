inherited frmAgendaComum: TfrmAgendaComum
  Left = 73
  Top = 248
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Agendamento'
  ClientHeight = 353
  ClientWidth = 695
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 47
    Width = 695
    Height = 267
    object Label8: TLabel
      Left = 381
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Assunto:'
    end
    object Label13: TLabel
      Left = 381
      Top = 117
      Width = 73
      Height = 13
      Caption = 'Observação:'
    end
    object Label6: TLabel
      Left = 604
      Top = 14
      Width = 75
      Height = 13
      Caption = 'Num. Atend.:'
      FocusControl = dbedtIdAtend
    end
    object Label12: TLabel
      Left = 483
      Top = 13
      Width = 97
      Height = 13
      Caption = 'Última alteração:'
      FocusControl = dbedtDataAlteracao
    end
    object Label14: TLabel
      Left = 381
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 188
      Width = 675
      Height = 66
      Caption = 'Dados do Agendamento'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object pnlAgendamento: TPanel
        Left = 3
        Top = 16
        Width = 670
        Height = 45
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object Label7: TLabel
          Left = 6
          Top = 3
          Width = 59
          Height = 13
          Caption = 'Atendente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 430
          Top = 3
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 552
          Top = 3
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = dbHora
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cmbAtendente: TwwDBLookupCombo
          Left = 6
          Top = 19
          Width = 411
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Usuário'#9'F'
            'NOMEUSUARIO'#9'20'#9'Nome'#9'F')
          DataField = 'IDATENDEAGENDA'
          DataSource = ds
          LookupTable = cdsAtendeAgenda
          LookupField = 'IDATENDEAGENDA'
          Style = csDropDownList
          AutoSelect = False
          Color = clBtnFace
          DropDownCount = 0
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          AutoDropDown = False
          ShowButton = False
          AllowClearKey = False
        end
        object dtData: TwwDBDateTimePicker
          Left = 430
          Top = 19
          Width = 110
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          DataField = 'DATA'
          DataSource = ds
          Epoch = 1950
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 1
          DisplayFormat = 'dd/mm/yyyy'
        end
        object dbHora: TDBEdit
          Left = 552
          Top = 19
          Width = 110
          Height = 21
          Color = clBtnFace
          DataField = 'HORA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object cmbAssunto: TwwDBLookupCombo
      Left = 381
      Top = 80
      Width = 304
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
      DataField = 'IDASSUNTOAGENDA'
      DataSource = ds
      LookupTable = cdsAssunto
      LookupField = 'IDASSUNTOAGENDA'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbmemObservacao: TDBMemo
      Left = 380
      Top = 133
      Width = 304
      Height = 49
      DataField = 'OBSERVACAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object dbedtIdAtend: TDBEdit
      Left = 604
      Top = 30
      Width = 80
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDATEND'
      DataSource = ds
      ReadOnly = True
      TabOrder = 3
    end
    object dbedtDataAlteracao: TDBEdit
      Left = 483
      Top = 29
      Width = 113
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DATAALTERACAO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 2
    end
    object edtSituacao: TEdit
      Left = 381
      Top = 29
      Width = 93
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object grpSolicitante: TGroupBox
      Left = 10
      Top = 8
      Width = 359
      Height = 174
      Caption = 'Solicitante'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 40
        Width = 48
        Height = 13
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 83
        Width = 46
        Height = 13
        Caption = 'Inscrição:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 126
        Width = 37
        Height = 13
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 97
        Top = 83
        Width = 30
        Height = 13
        Caption = 'Plano:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 97
        Top = 40
        Width = 69
        Height = 13
        Caption = 'Patrocinadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 250
        Top = 126
        Width = 55
        Height = 13
        Caption = 'Telefone:'
        FocusControl = dbedtTelefone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtMatricula: TEdit
        Left = 10
        Top = 55
        Width = 80
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtInscricao: TEdit
        Left = 10
        Top = 98
        Width = 80
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtNome: TEdit
        Left = 10
        Top = 142
        Width = 230
        Height = 21
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 60
        ParentFont = False
        TabOrder = 4
      end
      object edtPlano: TEdit
        Left = 98
        Top = 98
        Width = 250
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtPatrocinadora: TEdit
        Left = 98
        Top = 55
        Width = 250
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtTelefone: TDBEdit
        Left = 248
        Top = 142
        Width = 101
        Height = 21
        Color = clBtnFace
        DataField = 'TELEFONE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object cbElegivel: TCheckBox
        Left = 10
        Top = 18
        Width = 145
        Height = 17
        Caption = 'Elegível/Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
    end
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 695
    inherited tb97Fundo: TToolbar97
      Left = 523
      DockPos = 871
      inherited sep3: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 354
      DockPos = 374
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Cancel'
      end
    end
  end
  object Dock972: TDock97 [2]
    Left = 0
    Top = 0
    Width = 695
    Height = 47
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BackgroundTransparent = True
    BoundLines = [blTop, blBottom]
    object Toolbar: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 0
      TabOrder = 0
      object btnCancelar: TToolbarButton97
        Left = 60
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        Caption = '&Cancelar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
          8000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00FF00FF008080
          8000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00FF00FF00C0C0
          C0008080800000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF00FFFF
          FF000000FF0000FFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF000000FF000000FF000000FF000000FF00FFFFFF000000
          FF000000FF000000FF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF000000FF000000FF000000FF000000FF000000
          FF000000FF00FFFFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF0000FFFF000000FF000000FF000000FF0000FF
          FF00FFFFFF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF000000
          FF0000FFFF00FFFFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF000000FF000000FF000000FF000000FF000000
          FF000000FF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF000000FF000000FF0000FFFF0000FFFF000000
          FF000000FF000000FF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF000000FF000000FF0000FFFF0000FFFF0000FF
          FF000000FF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C0008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C00080808000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ImageIndex = 0
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = btnCancelarClick
      end
      object btnEfetivar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        Caption = 'E&fetivar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C0C0
          C000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00FF00FF00C0C0
          C000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF00FFFFFF0000800000FFFFFF0000FFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF0000FFFF000080000000800000FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF0000800000008000000080000000800000FFFF
          FF0000FFFF00FFFFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF00008000000080000000800000008000000080
          0000FFFFFF0000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF00008000000080000000FFFF00FFFFFF00008000000080
          000000FFFF00FFFFFF0000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000080
          00000080000000FFFF00FFFFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000FF
          FF00008000000080000000FFFF008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C00000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000800000008000008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF00FFFFFF00008000008080800080808000FF00FF00FF00FF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C0000080000080808000FF00FF00FF00FF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C0000080000000800000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ImageIndex = 0
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = btnEfetivarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 59
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object cdsAtendeAgenda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 111
    object cdsAtendeAgendaNOME: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object cdsAtendeAgendaNOMEUSUARIO: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object cdsAtendeAgendaIDATENDEAGENDA: TFloatField
      FieldName = 'IDATENDEAGENDA'
      Visible = False
    end
  end
  object ds: TDataSource
    DataSet = Cds
    Left = 264
    Top = 112
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 300
    Top = 23
    object CdsIDAGENDAMENTO: TFloatField
      FieldName = 'IDAGENDAMENTO'
    end
    object CdsIDATENDEAGENDA: TFloatField
      FieldName = 'IDATENDEAGENDA'
    end
    object CdsIDATEND: TFloatField
      FieldName = 'IDATEND'
    end
    object CdsIDASSUNTOAGENDA: TFloatField
      FieldName = 'IDASSUNTOAGENDA'
    end
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsDATA: TDateTimeField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object CdsHORA: TStringField
      FieldName = 'HORA'
      EditMask = '99:99;0; '
      Size = 4
    end
    object CdsTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object CdsFLGSITUACAO: TFloatField
      FieldName = 'FLGSITUACAO'
    end
    object CdsNOMESOLIC: TStringField
      DisplayWidth = 60
      FieldName = 'NOMESOLIC'
      Size = 60
    end
    object CdsOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      BlobType = ftBlob
      Size = 500
    end
    object CdsDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      EditMask = 'dd/mm/yyyy hh:mm'
    end
  end
  object cdsAssunto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 55
    object cdsAssuntoDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsAssuntoIDASSUNTOAGENDA: TFloatField
      FieldName = 'IDASSUNTOAGENDA'
      Visible = False
    end
    object cdsAssuntoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
  end
  object cdsSolicitanteEleg: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 111
  end
  object msSolicitante: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona solicitante...'
    Colunas.Strings = (
      'P.NOME'
      
        'DECODE( T.INSCRICAONUMERO, '#39#39', '#39'Elegível'#39', '#39'Participante'#39' ) AS T' +
        'IPO '
      'E.MATRICULA'
      'T.INSCRICAONUMERO'
      'S.NOME AS PATROCINADORA'
      'N.NOME AS PLANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Tipo'
      'Matrícula'
      'Inscrição'
      'Patrocinadora'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGPATRO E'
      'PESSOA P'
      'PARTPREVPLAN T'
      'PATRO R'
      'PESSOA S'
      'PLANPREV N')
    CamposChave.Strings = (
      'E.IDPESSOA')
    Filtro.Strings = (
      'E.IDPESSOA    = P.IDPESSOA'
      'E.IDPESSOA    = T.IDPESSOA (+)'
      'E.IDPESSJUR   = T.IDPESSJUR (+)'
      '( ( T.FLGDESATIVADO = 0 ) OR ( T.FLGDESATIVADO IS NULL ) )'
      'E.IDPESSJUR   = R.IDPESSOA'
      'R.IDPESSOA    = S.IDPESSOA'
      'T.IDPLANOPREV = N.IDPLANOPREV (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '10'
      '13'
      '10'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 216
    Top = 63
  end
end
