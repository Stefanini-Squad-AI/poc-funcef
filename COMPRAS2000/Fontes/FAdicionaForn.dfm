inherited frmAdicionaForn: TfrmAdicionaForn
  Left = 59
  Top = 78
  Caption = 'Adiciona Fornecedor ao Processo'
  ClientHeight = 403
  ClientWidth = 644
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 644
    Height = 364
    object btnTodas: TSpeedButton
      Left = 488
      Top = 8
      Width = 137
      Height = 32
      Hint = 'Marca todas as autorizações'
      AllowAllUp = True
      Caption = 'Marcar todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333300000
        0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
        FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
        9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
        00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
        993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
        3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
        3333388888887733333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnTodasClick
    end
    object btnInverter: TSpeedButton
      Left = 488
      Top = 41
      Width = 137
      Height = 32
      Hint = 'Desmarca todas as autorizações'
      AllowAllUp = True
      Caption = 'Inverter seleção'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333000000003333333388888888333333330FFF
        FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
        FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
        FFF0333833338FFFFFF833333333000000003333333388888888000000003333
        333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
        00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
        033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
        3333888888877333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnInverterClick
    end
    object cmpfNovoForn: TCMProcuraForCli
      Left = 16
      Top = 16
      Width = 457
      Height = 50
      Caption = ' Novo Fornecedor '
      TabOrder = 0
      OnExit = cmpfNovoFornExit
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Fornecedor não pode estar em branco'
      Mensagens.NaoExiste = 'Fornecedor não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
      MostraStatusCredito = False
    end
    object Panel7: TPanel
      Left = 1
      Top = 83
      Width = 642
      Height = 280
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 642
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel3'
        TabOrder = 0
        object grdItem: TwwDBGrid
          Left = 0
          Top = 26
          Width = 642
          Height = 254
          Selected.Strings = (
            'ATRIBUIDO'#9'1'#9'Adicionar'
            'CODARTIGO'#9'14'#9'Código'
            'DESCRICAO'#9'45'#9'Descrição'
            'QTDEPEDIDA'#9'10'#9'Quatidatde'
            'CODMEDIDA'#9'4'#9'Unidade')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = True
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          ParentCtl3D = False
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
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 642
          Height = 26
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Itens do Processo de Compra'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 644
    inherited tb97Fundo: TToolbar97
      Left = 472
      DockPos = 475
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 303
      DockPos = 306
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65523
  end
end
