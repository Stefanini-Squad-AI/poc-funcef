{-------------------------------------------------------------------------------

     CADASTRO DE PARAMETROS DO QUADRO DE AVISOS  ( MT )

     Módulo          :  AdminImob
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  30/11/2004
     Data de Término :  30/11/2004

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina ......:
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add : Pagamento de Parcelamento - FLGPGTOPARC , DIAPGTOPARC
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
-------------------------------------------------------------------------------}

unit fCadAvisoImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  Wwdbspin, DBCtrls, mUsuario, uCtrlAvisoImob, uCmSqlParams;

type
  TfrmCadAvisoImob = class(TFrmCadastroMestreDetMTImob)
    MolUsuario1: TMolUsuario;
    tbsParam: TTabSheet;
    GroupBox7: TGroupBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    wwDBSpinEdit2: TwwDBSpinEdit;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBSpinEdit3: TwwDBSpinEdit;
    wwDBSpinEdit4: TwwDBSpinEdit;
    wwDBSpinEdit5: TwwDBSpinEdit;
    wwDBSpinEdit6: TwwDBSpinEdit;
    DBCheckBox30: TDBCheckBox;
    MolUsuario2: TMolUsuario;
    cdsAvisoImobxUsu: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    DBCheckBox3: TDBCheckBox;
    wwDBSpinEdit7: TwwDBSpinEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlAvisoImob : TCtrlAvisoImob;

    procedure Seleciona (const iIdUsuario: Integer);
    function  VerificaPreenchimento: Boolean;
    function  VerificaPreenchimentoDetalhe: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadAvisoImob: TfrmCadAvisoImob;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uModuloImobiliario,
     uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadAvisoImob }

procedure TfrmCadAvisoImob.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlAvisoImob := TCtrlAvisoImob.Create;

  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlAvisoImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlAvisoImob.CdsAvisoImob     := Cds;
  CtrlAvisoImob.CdsAvisoImobxUsu := cdsAvisoImobxUsu;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.

  // Abre cds em branco e posiciona na primeira Guia
  Seleciona( -2 );
  pgctrlDetalhe.ActivePageIndex := 0;
end;

procedure TfrmCadAvisoImob.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlAvisoImob );
  inherited;
end;


procedure TfrmCadAvisoImob.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then Seleciona( StrToInt(MontaSelect.ValoresChave[0]) );
end;


procedure TfrmCadAvisoImob.Seleciona(const iIdUsuario: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data := CtrlAvisoImob.LookupAvisoImob(iIdUsuario);
  cdsAvisoImobxUsu.Data := CtrlAvisoImob.LookupAvisoImobxUsu(iIdUsuario);

  MolUsuario1.iUsuario        := Cds.FieldByName('IDUSUARIO').AsInteger;
  MolUsuario1.edtUsuario.Text := Cds.FieldByName('USUARIO_EXTENSO').AsString;
end;

function TfrmCadAvisoImob.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if MolUsuario1.iUsuario <= 0 then
        raise EValidacao.CreateVal('Selecione um Usuário',MolUsuario1.btnBuscaUsuario);
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;

function TfrmCadAvisoImob.VerificaPreenchimentoDetalhe: Boolean;
begin
  Result := False;
  try
     if MolUsuario2.iUsuario <= 0 then
        raise EValidacao.CreateVal('Selecione um Usuário adicional',MolUsuario2.btnBuscaUsuario);
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;


procedure TfrmCadAvisoImob.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa os Frames e abre CDS em branco
  MolUsuario1.btnLimpaUsuarioClick( Self );
  Seleciona( -2 );

  inherited;

  cds.FieldByName('FLGENCERALUG').AsString   := 'N';
  cds.FieldByName('FLGREVISALUG').AsString   := 'N';
  cds.FieldByName('FLGRENOVALUG').AsString   := 'N';
  cds.FieldByName('FLGREAJUALUG').AsString   := 'N';
  cds.FieldByName('FLGENCERSEGU').AsString   := 'N';
  cds.FieldByName('FLGVENCIFIAN').AsString   := 'N';
  cds.FieldByName('FLGAVISOEVENTO').AsString := 'N';
  cds.FieldByName('FLGRESPONSAVEL').AsString := 'N';
  // Helen - SOL: 127213 KTN: 672023
  cds.FieldByName('FLGPGTOPARC').AsString    := 'N';
end;

procedure TfrmCadAvisoImob.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.FieldByName('IDUSUARIO').AsFloat := MolUsuario1.iUsuario;
  Accept := CtrlAvisoImob.GravaAvisoImob;
end;

procedure TfrmCadAvisoImob.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAvisoImob.ExcluiAvisoImob;
end;

procedure TfrmCadAvisoImob.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadAvisoImob.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  Seleciona( Cds.FieldByName('IDUSUARIO').AsInteger );
end;


procedure TfrmCadAvisoImob.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  // Limpa os Frames
  MolUsuario1.btnLimpaUsuarioClick( Self );
end;

procedure TfrmCadAvisoImob.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if cds.State in[dsEdit,dsInsert] then
       tbsParam.Enabled := True
  else tbsParam.Enabled := False;
end;

procedure TfrmCadAvisoImob.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  MolUsuario2.btnLimpaUsuarioClick( Self );
end;

procedure TfrmCadAvisoImob.CmeDetalheConfirma(Sender: TObject);
begin
   if cdsAvisoImobxUsu.State in dsEditModes then begin
     if VerificaPreenchimentoDetalhe then begin
        cdsAvisoImobxUsu.FieldByName('IDOUTROUSUARIO').AsInteger := MolUsuario2.iUsuario;
        cdsAvisoImobxUsu.FieldByName('NOMEUSUARIO').AsString     := MolUsuario2.sLogin;
        cdsAvisoImobxUsu.FieldByName('NOME').AsString            := MolUsuario2.sNomeUsuario;
        inherited;
     end;
   end else begin
     inherited;
   end;
end;

end.
