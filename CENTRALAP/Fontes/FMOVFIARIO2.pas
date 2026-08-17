unit FMOVFIARIO;
  

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, MontaSelect, Mask, DBTables, Wwquery,Ufiario, wwdblook;

type
  TFRMMOVFIARIO = class(TfrmCadastroPai)
    MontaParticipante: TMontaSelect;
    MontaDependente: TMontaSelect;
    Assunto: TLabel;
    Label1: TLabel;
    edparticipante: TEdit;
    memoAssunto: TMemo;
    dblkGrupo: TwwDBLookupCombo;
    Label2: TLabel;
    qryassunto: TwwQuery;
    qryassuntoDESCRICAO: TStringField;
    qryassuntoIDFIARASS: TFloatField;
    sbtndependente: TToolbarButton97;
    sbtnparticipante: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnparticipanteClick(Sender: TObject);
    procedure sbtndependenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMMOVFIARIO: TFRMMOVFIARIO;

implementation
  Uses UdataBase,Usistema,Ubiblioteca;
{$R *.DFM}

procedure TFRMMOVFIARIO.FormCreate(Sender: TObject);
begin
// inherited;
   memoAssunto.enabled   := false;
   bbtnconfirmar.enabled := false;
   bbtncancelar.enabled  := false;
   sbtninserir.enabled   := false;
   pnlFundo.Enabled      := False;
   Fiario                := TFiario.Create;
end;

procedure TFRMMOVFIARIO.sbtnInserirClick(Sender: TObject);
begin
 // inherited;
 pnlFundo.Enabled           := True;
 if edparticipante.text <> '' then
  begin
   sbtninserir.enabled      := false;
   sbtnparticipante.enabled := false;
   sbtndependente.enabled   := false;
   memoAssunto.enabled      := true;
   bbtnconfirmar.enabled    := true;
   bbtncancelar.enabled     := true;
  end
  else
  begin
    Application.MessageBox('Não informou participante ou dependente. ','Participante/Dependente',Mb_IconInformation);
  end;
end;

procedure TFRMMOVFIARIO.bbtnConfirmarClick(Sender: TObject);
var
 id : integer;
begin
//  inherited;
   if memoAssunto.text = ''  then
      begin
       Application.MessageBox('Assunto tem que ser informado. ','Assunto',Mb_IconInformation);
       memoAssunto.setfocus;
      end;

   IF Self.Tag = 1  then
   begin
      Fiario.IdPessoa  := strtoint(Montaparticipante.ValoresChave[0]);
      Fiario.IdTitular := strtoint(Montaparticipante.ValoresChave[0]);
   end;
    IF Self.Tag = 2 then
   begin
      Fiario.IdPessoa  :=  strtoint(Montadependente.ValoresChave[1]);
      Fiario.IdTitular := strtoint(Montadependente.ValoresChave[0]);
   end;
   Fiario.Idusuario    :=sistema.idusuario;
   Fiario.Idmodulo     :=  19;
   Fiario.Idrubs       := 0;
   Fiario.Descricao    :=  memoAssunto.text;
   Fiario.DataInclusao := Date;
   Fiario.IdGrupo      := StrtoInt(dblkGrupo.LookupValue);
   StartTransacao;
   If Fiario.Inserir Then
      CommitTransacao
   Else
     RollbackTransacao;
   sbtninserir.enabled      := false;
   sbtnparticipante.enabled := true;
   sbtndependente.enabled   := true;
   memoAssunto.enabled      := false;
   bbtnconfirmar.enabled    := false;
   bbtncancelar.enabled     := false;
   memoAssunto.text         := '';
   tag                      := 0;
   pnlFundo.Enabled         := False;
end;

procedure TFRMMOVFIARIO.bbtnCancelarClick(Sender: TObject);
begin
 // inherited;
 sbtninserir.enabled        := false;
   sbtnparticipante.enabled := true;
   sbtndependente.enabled   := true;
   memoAssunto.enabled      := false;
   bbtnconfirmar.enabled    := false;
   bbtncancelar.enabled     := false;
   memoAssunto.text         := '';
   tag                      := 0;
   pnlFundo.Enabled         := False;
end;

procedure TFRMMOVFIARIO.sbtnparticipanteClick(Sender: TObject);
begin
 // inherited;
  montaparticipante.executar;
  sbtninserir.enabled := true;
  tag := 1;
  If Montaparticipante.RetornouValor Then
      edparticipante.text := Montaparticipante.ValoresChave[1]
     Else
      edparticipante.text := '';
end;

procedure TFRMMOVFIARIO.sbtndependenteClick(Sender: TObject);
begin
  inherited;
  montadependente.executar ;
  If Montadependente.RetornouValor Then
      edparticipante.text := Montadependente.ValoresChave[2]
     Else
      edparticipante.text := '';
  sbtninserir.enabled := true;
  tag := 2;
end;

procedure TFRMMOVFIARIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 inherited;
 Fiario.Free;
end;

procedure TFRMMOVFIARIO.FormShow(Sender: TObject);
begin
  inherited;
  qryassunto.Close;
  qryassunto.Open;
end;

end.
