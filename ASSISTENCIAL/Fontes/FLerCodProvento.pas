unit FLerCodProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, Db, DBTables, Wwquery;

type
  TfrmLerCodProvento = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    gbRubrica: TGroupBox;
    pnlPatrocinadora: TPanel;
    LabelCodigo: TLabel;
    LabelCodRub: TLabel;
    Label2: TLabel;
    labelDescricao: TLabel;
    gbAssoc: TGroupBox;
    LabelAssocDesc: TLabel;
    edDescProvento: TEdit;
    LabelAssocCod: TLabel;
    EdCodProvento: TEdit;
    gbPatrocinadora: TGroupBox;
    lbPatrocinadora: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Procedure Associa;
    { Private declarations }
  public
    { Public declarations }
    sCodProvento,
    sDescProvento  : string;
  end;

var
  frmLerCodProvento: TfrmLerCodProvento;

implementation

uses FAssocProvPatro, UMensErro, DBaseDados;

{$R *.DFM}

Procedure TfrmLerCodProvento.Associa;
begin
  if (Trim(sCodProvento) = '') Or (Trim(sDescProvento) = '') then
  begin 
    MsgDlg('Código da Rubrica não pode ser nulo. Rubrica não associada.','Informação',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  // Verificar restrições de agrupamento de codprovdesc

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT RP.DESCRPROVDESC, P.FLGTPRUBRICA '+
                  ' FROM RUBRICAXPESS RP, PROVDESC P'+
                 ' WHERE (RP.IDPESSOA = '+FrmAssocProvPatro.qryPatro.FieldByName('IdPESSOA').AsString+')'+
                 '   AND (RP.CODPROVDESC = '''+sCodProvento+''')'+
                 '   AND (P.IDPROVENTO = RP.IDRUBRICA) ');
  qryAux.Open;

  // se a rubrica for A,E ou P, nao poderá ser agrupada com outra
      // de outro tipo
   if (not qryAux.IsEmpty) and
       (Copy(qryAux.FieldByName('flgTpRubrica').AsString,1,1)<>'A') then
      begin
        MsgDlg('Rubricas de grupos diferentes não podem ser agrupadas. '+
               'Já existe outra rubrica com este código. '+
               'Rubrica não associada.','Informação',mtInformation,[mbOk,mbHelp],0);
        qryAux.Close;
        Exit;
      end;
  //end;

  // Gravar provento
  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('INSERT INTO RUBRICAXPESS(IDRUBRICA,IDPESSOA,CODPROVDESC,DESCRPROVDESC) '+
                 ' VALUES('+FrmAssocProvPatro.qryProv.FieldByName('IdProvento').AsString+', '+
                            FrmAssocProvPatro.qryPatro.FieldByName('IdPESSOA').AsString+
                            ', '''+sCodProvento+''', '''+sDescProvento+''')');

  try
     qryAux.ExecSQL;
     dtmBaseDados.dbBaseDados.Commit;
  except
    on E: EDBEngineError do begin
      MostrarErro(E);
      dtmBaseDados.dbBaseDados.Rollback;
      Exit;
    end; { on }
  end; { try .. except }

  If not FrmAssocProvPatro.qryProv.Eof then FrmAssocProvPatro.qryProv.Next;
end;

procedure TfrmLerCodProvento.FormShow(Sender: TObject);
begin
  inherited;
  sCodProvento := '';
  sDescProvento := '';
end;

procedure TfrmLerCodProvento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sCodProvento := edCodProvento.Text;
  sDescProvento:= edDescProvento.Text;

  Associa;

  ModalResult := mrOk;
  Close;
end;

procedure TfrmLerCodProvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sCodProvento := '';
  sDescProvento := '';
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmLerCodProvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//inherited; - > NAO EXECUTAR O CAFREE

end;

end.
