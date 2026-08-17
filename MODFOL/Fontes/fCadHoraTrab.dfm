inherited frmCadHoraTrab: TfrmCadHoraTrab
  Left = 253
  Top = 152
  Width = 468
  Height = 407
  BorderStyle = bsSizeable
  Caption = 'Horários de Trabalho'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    Height = 294
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 452
      Height = 286
      object Label1: TLabel
        Left = 36
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 36
        Top = 66
        Width = 103
        Height = 13
        Caption = 'Descrição Horário'
        FocusControl = dbedHorario
      end
      object Label3: TLabel
        Left = 36
        Top = 114
        Width = 90
        Height = 13
        Caption = 'Jornada Mensal'
        FocusControl = dbedJornada
      end
      object dbedCodigo: TDBEdit
        Left = 36
        Top = 36
        Width = 64
        Height = 21
        DataField = 'IDHORARIO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedHorario: TDBEdit
        Left = 36
        Top = 81
        Width = 382
        Height = 21
        DataField = 'NOMEHORARIO'
        DataSource = ds
        TabOrder = 1
      end
      object dbedJornada: TDBEdit
        Left = 36
        Top = 129
        Width = 91
        Height = 21
        DataField = 'JORNADAMENSAL'
        DataSource = ds
        TabOrder = 2
      end
      object dbrgTipoHorario: TDBRadioGroup
        Left = 36
        Top = 164
        Width = 154
        Height = 65
        Caption = 'Tipo de Horário'
        DataField = 'FLGTIPOHORARIO'
        DataSource = ds
        Items.Strings = (
          'Fixo na Semana'
          'Escala Rotativa')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
        OnChange = dbrgTipoHorarioChange
      end
      object gbxEscala: TGroupBox
        Left = 219
        Top = 114
        Width = 199
        Height = 116
        Caption = 'Qtde. de Horas da Escala'
        TabOrder = 4
        object Label4: TLabel
          Left = 29
          Top = 22
          Width = 43
          Height = 13
          Caption = 'Folga 1'
          FocusControl = dbedJornada
        end
        object Label5: TLabel
          Left = 29
          Top = 55
          Width = 44
          Height = 13
          Caption = 'Serviço'
          FocusControl = dbedJornada
        end
        object Label6: TLabel
          Left = 29
          Top = 88
          Width = 43
          Height = 13
          Caption = 'Folga 2'
          FocusControl = dbedJornada
        end
        object dbreFolga1: TDBRealEdit
          Left = 110
          Top = 18
          Width = 60
          Height = 21
          Hint = 
            'Entre Zero Hora da Data Ref. (Início do 1.o Ciclo) e Início do S' +
            'erviço'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'HORASFOLGA1'
          DataSource = ds
        end
        object DBRealEdit2: TDBRealEdit
          Left = 110
          Top = 51
          Width = 60
          Height = 21
          Hint = 'Horas de Trabalho na Escala'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'HORASSERVICO'
          DataSource = ds
        end
        object DBRealEdit3: TDBRealEdit
          Left = 110
          Top = 84
          Width = 60
          Height = 21
          Hint = 'Entre Final do Serviço e Início do Próximo Ciclo'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'HORASFOLGA2'
          DataSource = ds
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 452
      Height = 286
      Selected.Strings = (
        'IDHORARIO'#9'10'#9'Código'
        'NOMEHORARIO'#9'40'#9'Nome'
        'FLGTIPOHORARIO'#9'10'#9'Fixo na Semana ?')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 460
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 265
      DockPos = 265
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 97
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '  IDHORARIO, NOMEHORARIO, JORNADAMENSAL, FLGTIPOHORARIO,'
      '  HORASFOLGA1, HORASSERVICO, HORASFOLGA2'
      'FROM'
      '  HORATRAB'
      'ORDER BY'
      '  IDHORARIO')
    ControlType.Strings = (
      'FLGTIPOHORARIO;CheckBox;0;1')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HORATRAB'
      'set'
      '  IDHORARIO = :IDHORARIO,'
      '  NOMEHORARIO = :NOMEHORARIO,'
      '  JORNADAMENSAL = :JORNADAMENSAL,'
      '  FLGTIPOHORARIO = :FLGTIPOHORARIO,'
      '  HORASFOLGA1 = :HORASFOLGA1,'
      '  HORASSERVICO = :HORASSERVICO,'
      '  HORASFOLGA2 = :HORASFOLGA2'
      'where'
      '  IDHORARIO = :OLD_IDHORARIO')
    InsertSQL.Strings = (
      'insert into HORATRAB'
      
        '  (IDHORARIO, NOMEHORARIO, JORNADAMENSAL, FLGTIPOHORARIO, HORASF' +
        'OLGA1, '
      '   HORASSERVICO, HORASFOLGA2)'
      'values'
      
        '  (:IDHORARIO, :NOMEHORARIO, :JORNADAMENSAL, :FLGTIPOHORARIO, :H' +
        'ORASFOLGA1, '
      '   :HORASSERVICO, :HORASFOLGA2)')
    DeleteSQL.Strings = (
      'delete from HORATRAB'
      'where'
      '  IDHORARIO = :OLD_IDHORARIO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Horários de Trabalho'
    Colunas.Strings = (
      'HORATRAB.IDHORARIO'
      'HORATRAB.NOMEHORARIO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'HORATRAB')
    CamposChave.Strings = (
      'HORATRAB.IDHORARIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
