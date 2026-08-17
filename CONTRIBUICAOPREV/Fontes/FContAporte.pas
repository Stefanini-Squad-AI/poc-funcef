unit FContAporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TfrmContAporte = class(TfrmOkCancelar)
    qrycontrib: TwwQuery;
    dscontrib: TwwDataSource;
    cmbcontrib: TwwDBLookupCombo;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblpessoa: TLabel;
    lblpatro: TLabel;
    lblplano: TLabel;

    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private // Private declarations


  public  // Public declarations

     procedure  AbrirFormContrib(sidpessjur,sidplanoprev,sidpessoa,sseqproposta,snome,splano,spatro : String);


  end;



var
  frmContAporte: TfrmContAporte;
  bSaiuCont,bSaiuContApp : Boolean;
  sIdcontrib : String;
  sidpessjurCont,  sidplanoprevCont,  sidpessoaCont,
  sseqpropostaCont,  snomeCont,  splanoCont,  spatroCont : String;



implementation
{$R *.DFM}
uses
  FDivergContrib, UMensErro, UDataBase, FTelaAut;



procedure TfrmContAporte.bbtnSairClick(Sender: TObject);
begin

  if  MsgDlg('Deseja realmente sair do tratamento de aporte?.','Confirmação',mtConfirmation,[mbyes,mbno],0) = mryes
  then
  begin
    bSaiuContApp := true;
    bSaiuCont := false;
  end
  else exit;
  inherited;
end;


procedure TfrmContAporte.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if cmbcontrib.text = '' then
  begin
     MsgDlg('É preciso digitar a Contribuição.','Erro',mtError,[mbOk],0);
     exit;
  end;

  sIdContrib := qrycontrib.fieldbyname('IDCONTRIBUICAO').AsString;

  bSaiuContApp := false;
  bSaiuCont := false;
  close;
end;



procedure  TfrmContAporte.AbrirFormContrib(sidpessjur,sidplanoprev,sidpessoa,sseqproposta,snome,splano,spatro : String);
begin
    sidpessjurCont:= sidpessjur;
    sidplanoprevCont:= sidplanoprev;
    sidpessoaCont := sidpessoa;
    sseqpropostaCont:= sseqproposta;
    snomeCont := snome;
    splanoCont := splano;
    spatroCont := spatro;

    AbrirFormModal(frmContAporte, TfrmContAporte);
    frmContAporte.free;
end;



procedure TfrmContAporte.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  bSaiuCont := true;
  bSaiuContApp := false;
  close;
end;



procedure TfrmContAporte.FormCreate(Sender: TObject);
begin
  inherited;
    qrycontrib.close;
    qrycontrib.parambyname('IDPESSJUR').AsString := sidpessjurcont;
    qrycontrib.parambyname('IDPLANOPREV').AsString := sidplanoprevcont;
    qrycontrib.parambyname('IDPESSOA').AsString := sidpessoacont;
    qrycontrib.parambyname('SEQPROPOSTA').AsString := sseqpropostacont;
    qrycontrib.open;

    lblpessoa.Caption := snomecont;
    lblplano.Caption := splanocont;
    lblpatro.Caption := spatrocont;
end;



end.