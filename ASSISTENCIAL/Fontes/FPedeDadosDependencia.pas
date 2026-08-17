unit FPedeDadosDependencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TfrmPedeDadosDependencia = class(TfrmOkCancelar)
    pnlTitular: TPanel;
    grpDependente: TGroupBox;
    lblDependente: TLabel;
    Label30: TLabel;
    dblkcmbDependente: TwwDBLookupCombo;
    edseq: TEdit;
    Label4: TLabel;
    lblPart: TLabel;
    Label1: TLabel;
    lblDepen: TLabel;
    chkContaIR: TCheckBox;
    chkContaSalF: TCheckBox;
    Label2: TLabel;
    lblMatricula: TLabel;
    qryDepen: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function PedeDadosDependencia(psNomeParticipante,
                                  psNomeDependente,
                                  psMatricula : string;
                              var psIdDependencia : string;
                                  piNumSequencia : longint;
                              var piFlgContaIR,
                                  piFlgContaSalF : longint) : boolean;
  end;

var
  frmPedeDadosDependencia: TfrmPedeDadosDependencia;

implementation

uses UMensErro;
{$R *.DFM}

function TfrmPedeDadosDependencia.PedeDadosDependencia(psNomeParticipante,
         psNomeDependente, psMatricula : string; var psIdDependencia : string;
         piNumSequencia : longint; var piFlgContaIR, piFlgContaSalF : longint) : boolean;
begin
   //result := false;
   lblPart.Caption      := psNomeParticipante;
   lblDepen.Caption     := psNomeDependente;
   lblMatricula.Caption := psMatricula;
   edSeq.Text           := IntToStr(piNumSequencia);
   if not qryDepen.Active then
     qryDepen.Open;

   if Trim(psIdDependencia) <> '' then
   begin
     qryDepen.Locate('IDDEPENDENCIA', psIdDependencia, [loCaseInsensitive]);
     dblkcmbDependente.Text := qryDepen.FieldByName('descricao').AsString;
   end
   else
     dblkcmbDependente.Text := '';
   chkContaIR.Checked := (piFlgContaIR = 1);
   chkContaSalF.Checked := (piFlgContaSalF = 1);

   ShowModal;

   if ModalResult = mrOK then
   begin
      psIdDependencia := qryDepen.FieldByName('IdDependencia').AsString;
      if chkContaIR.Checked then
        piFlgContaIR := 1
      else
        piFlgContaIR := 0;

      if chkContaSalF.Checked then
        piFlgContaSalF  := 1
      else
        piFlgContaSalF  := 0;
      result := true;
   end
   else
   begin
      result := false;
      psIdDependencia := '';
      piFlgContaIR := 0;
      piFlgContaSalF := 0;
   end;
end;

procedure TfrmPedeDadosDependencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
   //  inherited;
   // nao tirar o comentario para nao dar o caFree
end;

procedure TfrmPedeDadosDependencia.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dblkcmbDependente.Text) = '' then
  begin
     MsgDlg('Informe o tipo de dependência. ','Erro',mtError,[mbOk],0);
     dblkcmbDependente.SetFocus;
     exit;
  end;
  inherited;
end;

procedure TfrmPedeDadosDependencia.FormShow(Sender: TObject);
begin
  inherited;
  dblkcmbDependente.SetFocus;
  if not qryDepen.Active then
    qryDepen.Open;
end;

procedure TfrmPedeDadosDependencia.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
