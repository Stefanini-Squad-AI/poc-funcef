inherited frmMotivoDesfazpreparo: TfrmMotivoDesfazpreparo
  Left = 13
  Top = 99
  Caption = 'Dados para Desfazer o Preparo'
  ClientHeight = 440
  ClientWidth = 763
  FormStyle = fsNormal
  Visible = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 401
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 753
      Height = 37
      Align = alTop
      TabOrder = 0
      object cbxTodos: TCheckBox
        Left = 6
        Top = 9
        Width = 739
        Height = 17
        Caption = 
          'Desfaz o Preparo para TODAS as Patrocinadoras, TODOS os Planos e' +
          ' TODOS os Beneficios (Inclusive os de Referência)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = cbxTodosClick
      end
    end
    object Panel6: TPanel
      Left = 5
      Top = 42
      Width = 753
      Height = 317
      Align = alClient
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 346
        Top = 1
        Width = 3
        Height = 248
        Cursor = crHSplit
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 345
        Height = 248
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 13
          Top = 5
          Width = 66
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Splitter1: TSplitter
          Left = 1
          Top = 128
          Width = 343
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel4: TPanel
          Left = 1
          Top = 131
          Width = 343
          Height = 116
          Align = alClient
          Caption = 'Panel4'
          TabOrder = 0
          object chklstPlano: TCheckListBox
            Left = 1
            Top = 23
            Width = 341
            Height = 92
            Hint = 'Planos Disponíveis para o Preparo da Folha de Benefícios'
            OnClickCheck = chklstPlanoClickCheck
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object PnlPlano: TPanel
            Left = 1
            Top = 1
            Width = 341
            Height = 22
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = '   Planos das Patrocinadoras selecionadas'
            TabOrder = 1
            OnClick = PnlPlanoClick
            object Image2: TImage
              Left = 322
              Top = 2
              Width = 17
              Height = 18
              Hint = 'Inverter seleção'
              Align = alRight
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170E6000000424DE60000000000000076000000280000000E00
                00000E0000000100040000000000700000000000000000000000100000001000
                0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00333333333333330033333333333333003333333333333300333330003333
                3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                3300330000F000033300333330F033333300333330F033333300333330003333
                330033333333333333003333333333333300}
              ShowHint = True
              Stretch = True
              OnClick = PnlPlanoClick
            end
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 343
          Height = 127
          Align = alTop
          Caption = 'Panel5'
          TabOrder = 1
          object chklstPatro: TCheckListBox
            Left = 1
            Top = 23
            Width = 341
            Height = 103
            Hint = 'Patrocinadoras Disponíveis para o Preparo'
            OnClickCheck = chklstPatroClickCheck
            Align = alClient
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object PnlPatrocinadora: TPanel
            Left = 1
            Top = 1
            Width = 341
            Height = 22
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = '    Patrocinadora com Assistidos'
            TabOrder = 1
            OnClick = PnlPatrocinadoraClick
            object Image1: TImage
              Left = 322
              Top = 2
              Width = 17
              Height = 18
              Hint = 'Inverter seleção'
              Align = alRight
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170E6000000424DE60000000000000076000000280000000E00
                00000E0000000100040000000000700000000000000000000000100000001000
                0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00333333333333330033333333333333003333333333333300333330003333
                3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                3300330000F000033300333330F033333300333330F033333300333330003333
                330033333333333333003333333333333300}
              ShowHint = True
              Stretch = True
              OnClick = PnlPatrocinadoraClick
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 349
        Top = 1
        Width = 403
        Height = 248
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 1
        object chklstBenef: TCheckListBox
          Left = 1
          Top = 23
          Width = 401
          Height = 224
          Hint = 'Benefícios disponiveis para o Preparo'
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object PnlBeneficio: TPanel
          Left = 1
          Top = 1
          Width = 401
          Height = 22
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = '   Benefícios'
          TabOrder = 1
          OnClick = PnlBeneficioClick
          object Image3: TImage
            Left = 382
            Top = 2
            Width = 17
            Height = 18
            Hint = 'Inverter seleção'
            Align = alRight
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170E6000000424DE60000000000000076000000280000000E00
              00000E0000000100040000000000700000000000000000000000100000001000
              0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00333333333333330033333333333333003333333333333300333330003333
              3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
              3300330000F000033300333330F033333300333330F033333300333330003333
              330033333333333333003333333333333300}
            ShowHint = True
            Stretch = True
            OnClick = PnlBeneficioClick
          end
          object chkreferencia: TCheckBox
            Left = 96
            Top = 3
            Width = 193
            Height = 17
            Caption = 'Inclusive os de referência'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chkreferenciaClick
          end
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 249
        Width = 751
        Height = 67
        Align = alBottom
        TabOrder = 2
        object Label2: TLabel
          Left = 7
          Top = 14
          Width = 72
          Height = 39
          Caption = 'Motivo para Desfazer o Preparo'
          WordWrap = True
        end
        object mmMotivo: TMemo
          Left = 87
          Top = 7
          Width = 658
          Height = 53
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Panel8: TPanel
      Left = 5
      Top = 359
      Width = 753
      Height = 37
      Align = alBottom
      TabOrder = 2
      object cboxRetido: TCheckBox
        Left = 14
        Top = 10
        Width = 427
        Height = 17
        Caption = 'Inclui no desfazer os benefícios retidos no mês em questão.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 107
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE (PT.IDFUNDACAO = :IDFUNDACAO)'
      'AND (P.IDPESSOA = PT.IDPESSOA)'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 712
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 451
    Top = 70
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 508
    Top = 77
  end
end
