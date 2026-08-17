inherited frmsenha: Tfrmsenha
  Left = 225
  Top = 152
  Caption = 'Informar Senha'
  ClientHeight = 192
  ClientWidth = 394
  FormStyle = fsNormal
  Visible = False
  OnClose = nil
  OnCreate = nil
  OnPaint = nil
  OnResize = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    Height = 153
    object Label1: TLabel
      Left = 88
      Top = 56
      Width = 102
      Height = 13
      Caption = 'Nome do Usuario:'
    end
    object Label2: TLabel
      Left = 88
      Top = 112
      Width = 97
      Height = 13
      Caption = 'Senha              :'
    end
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 346
      Height = 13
      Caption = 'Participante não é Elegível ,  para liberar a geração da Rub '
    end
    object Label4: TLabel
      Left = 16
      Top = 24
      Width = 87
      Height = 13
      Caption = 'digite a Senha.'
    end
    object edNomeUsuario: TEdit
      Left = 216
      Top = 48
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object EdSenha: TEdit
      Left = 216
      Top = 104
      Width = 121
      Height = 21
      MaxLength = 15
      PasswordChar = '*'
      TabOrder = 1
      Text = 'EdSenha'
    end
  end
  inherited Dock971: TDock97
    Top = 153
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 222
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 53
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 123
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qrySenha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select USU.SENHA'
      'from'
      '  usuariosistema usu,'
      '  funcao    func,'
      '  operfunc ope,'
      '  autoriza auto'
      'where'
      '    RTRIM(UPPER(usu.nomeusuario)) = UPPER(:usuario)'
      'and  usu.senha = :senha'
      'and auto.idespacesso = usu.idespacesso'
      'and ope.idoperfunc = auto.idoperfunc'
      'and func.idfuncao = ope.idfuncao'
      'and func.idfuncao = 14379'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 21
    Top = 83
    ParamData = <
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'senha'
        ParamType = ptUnknown
      end>
    object qrySenhaSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
      Size = 15
    end
  end
  object QryUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDUSUARIO FROM USUARIOSISTEMA '
      '   WHERE RTRIM(UPPER(NOMEUSUARIO)) = UPPER(:NOMEUSUARIO)')
    ValidateWithMask = True
    Left = 69
    Top = 83
    ParamData = <
      item
        DataType = ftString
        Name = 'NOMEUSUARIO'
        ParamType = ptUnknown
      end>
    object QryUsuarioIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.IDUSUARIO'
    end
  end
end
