inherited frmAtualizaSalario: TfrmAtualizaSalario
  Left = 28
  Top = 139
  HelpContext = 160002
  Caption = 'Atualização de Salários de Participantes'
  ClientHeight = 267
  ClientWidth = 481
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 481
    Height = 228
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object Label3: TLabel
      Left = 27
      Top = 186
      Width = 421
      Height = 31
      AutoSize = False
      Caption = 
        'ATENÇÃO : Esta tela atualiza o salário da tabela de participante' +
        's com o último salário que estiver no Histórico de Rubricas.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object dblkpcmbPatro: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 313
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object chklstSituacao: TCheckListBox
      Left = 23
      Top = 88
      Width = 314
      Height = 89
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        'Ativos'
        'Mantidos'
        'Mantidos Parciais')
      ParentFont = False
      TabOrder = 1
    end
    object bbtnReceber: TBitBtn
      Left = 345
      Top = 36
      Width = 115
      Height = 38
      Caption = '&Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnReceberClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
    end
    object Button1: TButton
      Left = 360
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      Visible = False
      OnClick = Button1Click
    end
  end
  inherited Dock971: TDock97
    Top = 228
    Width = 481
    inherited tb97Fundo: TToolbar97
      Left = 310
      DockPos = 310
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 275
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.NOME, PAT.IDRUBSALPARTICIP, PAT.IDRUBSALMAN' +
        'UT, PAT.IDRUBSALMANUTPARC'
      'FROM   PESSOA P, PATRO PAT'
      'WHERE P.IDPESSOA = PAT.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 468
    Top = 97
  end
  object qryParticipantes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA' +
        ', SP.FLGINTERNO'
      'FROM   PARTPREVPLAN PP, SITPART SP'
      'WHERE  (PP.IDPESSJUR = :IDPESSJUR)'
      'AND    (SP.FLGINTERNO = :SITUACAO )'
      'AND    (PP.IDSITPART = SP.IDSITPART)')
    ValidateWithMask = True
    Left = 466
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SITUACAO'
        ParamType = ptUnknown
      end>
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 208
    Top = 192
  end
end
