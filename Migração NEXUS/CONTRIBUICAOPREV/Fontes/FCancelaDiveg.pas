unit FCancelaDiveg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
    Db, Wwdatsrc, DBTables, Wwquery, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti;

type
  TfrmCancelaDiveg = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblpessoa: TLabel;
    lblpatro: TLabel;
    lblplano: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edSitAtual: TEdit;
    dtedcancel: TCMDateTimePicker;
    cmbsitpart: TwwDBLookupCombo;
    qrysitplanoprev: TwwQuery;
    dssitplanoprev: TwwDataSource;

    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private // Private declarations


  public  // Public declarations

    function PreencherTelaCancela(snome,splano,spatro,scaptiontela,snomesit,sflginterno : String) : Boolean;


  end;




var
  frmCancelaDiveg: TfrmCancelaDiveg;
  bSaiuCancela, bSaiuCancelaApp : Boolean;
  sIdSitPlanoprevDiverg : String;
  scaptiontelaDiverg, snomeDiverg, splanoDiverg
  ,spatroDiverg, snomesitDiverg, sflginternoDiverg : String;




implementation
{$R *.DFM}
uses
  FDivergContrib,UDataBase,UMensErro, FTelaAut;



procedure TfrmCancelaDiveg.bbtnSairClick(Sender: TObject);
begin
  if  MsgDlg('Deseja realmente sair do registro de Inadimplência?.','Confirmação',mtConfirmation,[mbyes,mbno],0) = mryes
  then
  begin
     bSaiuCancelaApp := true;
     bSaiuCancela := false;
  end
  else exit;
  inherited;

end;

procedure TfrmCancelaDiveg.bbtnCancelarClick(Sender: TObject);
begin
  bSaiuCancela := true;
  bSaiuCancelaApp := false;
  close;
  inherited;

end;

function TfrmCancelaDiveg.PreencherTelaCancela(snome,splano,spatro,scaptiontela,snomesit,sflginterno : String) : Boolean;
begin
   result := false;

   scaptiontelaDiverg := scaptiontela;
   snomeDiverg := snome;
   splanoDiverg := splano;
   spatroDiverg :=  spatro;
   snomesitDiverg := snomesit;
   sflginternoDiverg := sflginterno;

   try
       AbrirFormModal(  frmCancelaDiveg, TfrmCancelaDiveg);
      frmCancelaDiveg.free;
    except
      exit;
    end;

    result := true;
end;

procedure TfrmCancelaDiveg.bbtnConfirmarClick(Sender: TObject);
begin
  if cmbsitpart.text = '' then
  begin
     MsgDlg('É preciso selecionar a nova situação do Participante.','Erro',mtError,[mbOk],0);
     exit;
  end;


  sIdSitPlanoprevDiverg := qrysitplanoprev.fieldbyname('IDSITPLANOPREV').AsString;


  bSaiuCancelaApp := false;
  bSaiuCancela := false;
  close;
  inherited;

end;

procedure TfrmCancelaDiveg.FormCreate(Sender: TObject);
begin
  inherited;
   frmCancelaDiveg.caption := scaptiontelaDiverg;
   lblpessoa.caption := snomeDiverg;
   lblplano.caption := splanoDiverg;
   lblpatro.caption := spatroDiverg;
   edSitAtual.text := snomesitDiverg;
   qrysitplanoprev.close;
   qrysitplanoprev.parambyname('FLGINTERNO').AsString := sflginternoDiverg;
   qrysitplanoprev.open;
   dtedcancel.date := date;
   dtedcancel.text := datetostr(date);
end;



end.