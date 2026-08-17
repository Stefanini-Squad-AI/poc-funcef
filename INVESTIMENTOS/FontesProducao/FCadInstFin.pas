unit FCadInstFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, StdCtrls, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, UMensErro, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, TREdit;

type
  TfrmCadInstFin = class(TfrmPessoa)
    TbsInstFin: TTabSheet;
    GroupBox1: TGroupBox;
    LblSigla: TLabel;
    DBESIGLA: TwwDBEdit;
    QryAux: TwwQuery;
    qryProcuraInstFin: TwwQuery;

    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    function JaExiste : boolean ;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInstFin: TfrmCadInstFin;

implementation

{$R *.DFM}
procedure TfrmCadInstFin.CmeCadastroConfirma(Sender: TObject);

begin
 if qrysubtipo.FieldByName('SiglaInstFin').AsString = '' then
  begin
   MsgDlg('Sigla da Instituição Financeira deve ser Informada', 'Aviso', mtError, [mbOk, mbHelp], 0);
   pgctrlDetalhe.activepage := TbsInstFin;
   dbeSigla.setfocus;
   exit;
  end
 else
  if (ds.dataset.state  in [dsInsert, dsEdit]) then
   if JaExiste then
    if (MsgDlg('Existe Instituição Financeira Cadastrada com essa Sigla . Deseja Gravar ?', 'Aviso', mtWarning, [mbYes,mbNo],0) = mrYes) then
    else
     begin
      pgctrlDetalhe.activepage := TbsInstFin;
      dbeSigla.setfocus;
      exit;
     end;
 inherited
end;

procedure TfrmCadInstFin.CmeCadastroDelete(Sender: TObject);
var
 sSql        : String ;
begin
 try
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT PXI.IDPARAMINSTFIN, PXI.IDINSTFIN FROM PARAMXINSTFIN PXI WHERE PXI.IDINSTFIN = '''+qrySubTipo.FieldByname('IdInstFin').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    MsgDlg('Instituição Financeira com Parametros Associados, Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
    exit;
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT VPI.IDPARAMINSTFIN,VPI.IDINSTFIN FROM VALPARAMXINSTFIN VPI WHERE VPI.IDINSTFIN = '''+qrySubTipo.FieldByname('IdInstFin').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty  then
   begin
    MsgDlg('Instituição Financeira com Valores de Parametros Associados, Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
    qryAux.Close;
    exit;
   end;
  qryAux.Close;
 inherited;
 except raise ;
 end;
end;

procedure TfrmCadInstFin.FormActivate(Sender: TObject);
begin
 inherited;
 pgctrlDetalhe.activepage := TbsInstFin;
end;

procedure TfrmCadInstFin.sbtnApagarClick(Sender: TObject);
var
 ssql : String;
 begin
  try
   qryAux.Close;
   qryAux.SQL.Clear;
   sSql := 'SELECT PXI.IDPARAMINSTFIN, PXI.IDINSTFIN FROM PARAMXINSTFIN PXI WHERE PXI.IDINSTFIN = '''+qrySubTipo.FieldByname('IdInstFin').AsString + '''';
   sSql := sSql + ' UNION SELECT VPI.IDPARAMINSTFIN, VPI.IDINSTFIN FROM VALPARAMXINSTFIN VPI WHERE VPI.IDEMISSOR = '''+qrySubTipo.FieldByname('IdInstFin').AsString + '''';
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   if not qryAux.IsEmpty then
    begin
     MsgDlg('Instituição com Parâmetros Utilizados , Não pode ser Excluído',LerMensagem(2),mtError,[mbOk],0);
    end
   else
    inherited;
   qryAux.Close;
  except raise ;
  end;
end;

Function TfrmCadInstFin.JaExiste;
var
 ssql : string ;
begin
 Result := False ;
 Try
  qryProcuraInstFin.Sql.Clear;
  sSql := 'SELECT FN.IDINSTFIN,FN.SIGLAINSTFIN FROM INSTFIN FN WHERE FN.SIGLAINSTFIN = '''+qrySubTipo.FieldByname('SiglaInstFin').AsString + '''';
  qryProcuraInstFin.SQL.Add(sSQL);
  qryProcuraInstFin.Open;
  Result := not qryProcuraInstFin.IsEmpty;
  qryProcuraInstFin.Close;
 Except raise ;
 end;
end;

end.
