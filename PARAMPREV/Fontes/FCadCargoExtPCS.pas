unit FCadCargoExtPCS;

// Alterações:
{
----------------------------------------------------------------------------------------------------
Pendência   : SOL 144268 Kintana 949788
Responsável : BRUNO AZEVEDO
Data        : 22/09/2010
Descrição   : Na validação ao inserir um registro, verificar se é um cargo ou uma função.
----------------------------------------------------------------------------------------------------
Rotina    : sbtnInsDetClick(...)
Data      : 28/05/2007
Autor     : André Pontes
Pendência : 25174
Descrição : Retirada de restrição à inserção de novos grupos funcionais, mesmo em caso de função
            existente nas funções sem grupo
---------------------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  DBCtrls, Mask, wwdbedit, wwdblook,  CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, CmEventosCadastro,
  ImgList;

type
  TfrmCadCargoExtPCS = class(TfrmCadMestreDetalheCS)
    Label2: TLabel;
    dbedTitulo: TwwDBEdit;
    qryPCS: TwwQuery;
    dbgrpCargoFuncao: TDBRadioGroup;
    qryCarreira: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbedCodigo: TwwDBEdit;
    dbedDataFinal: TCMDateTimePicker;
    dbedDataInicio: TCMDateTimePicker;
    stPatro: TStaticText;
    stNomePatro: TStaticText;
    tbsGrupo: TTabSheet;
    tbsNivel: TTabSheet;
    pnlControlesGrupo: TPanel;
    pnlControlesNivel: TPanel;
    dbgrdGrupo: TwwDBGrid;
    dbgrdNivel: TwwDBGrid;
    dsGrupo: TwwDataSource;
    qryGrupo: TwwQuery;
    updGrupo: TUpdateSQL;
    Label12: TLabel;
    dbedInicioVigGrupo: TCMDateTimePicker;
    Label13: TLabel;
    qryGrupoFunc: TwwQuery;
    dblkpcmbGrupoFunc: TwwDBLookupCombo;
    dsNivel: TwwDataSource;
    qryNivel: TwwQuery;
    updNivel: TUpdateSQL;
    Label14: TLabel;
    dbedInicioVigNivel: TCMDateTimePicker;
    Label15: TLabel;
    dblkpcmbNivelFunc: TwwDBLookupCombo;
    qryNivelFunc: TwwQuery;
    qryTipoFunc: TwwQuery;
    dbedCodigoCargoExt: TDBEdit;
    lblCodigo: TLabel;
    dbedNomeResumido: TDBEdit;
    lblNomeResumido: TLabel;
    dbedFimVigGrupo: TCMDateTimePicker;
    lblFimVigencia: TLabel;
    dbedDataFimNivel: TCMDateTimePicker;
    lblDataFimNivel: TLabel;
    qryAux: TwwQuery;
    qryFuncaoCorresp: TwwQuery;
    dsFuncaoCorresp: TwwDataSource;
    MSFuncao: TMontaSelect;
    pnlCargo: TPanel;
    lblCarreira: TLabel;
    dblkpcmbCarreira: TwwDBLookupCombo;
    lblDesc: TLabel;
    dbedDescricao: TwwDBEdit;
    lblPCS: TLabel;
    dblkpcmbPCS: TwwDBLookupCombo;
    lblJornada: TLabel;
    dbspedJornada: TwwDBSpinEdit;
    lblHs: TLabel;
    lblCBO: TLabel;
    dbedCBO: TwwDBEdit;
    pnlFuncao: TPanel;
    lblDescricao: TLabel;
    dblkpcmbTipoFunc: TCMDBLookupCombo;
    lblFuncaoCorresp: TLabel;
    dblkpcmbFuncaoCorresp: TwwDBLookupCombo;
    sbtnBuscaFuncaoCorresp: TSpeedButton;
    dbrgrpFLGPCC: TDBRadioGroup;
    dbgrpAtivo: TDBRadioGroup;
    Label1: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure dbgrpCargoFuncaoClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnBuscaFuncaoCorrespClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbedCodigoCargoExtExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MontaGrids;
  end;

var
  frmCadCargoExtPCS: TfrmCadCargoExtPCS;

implementation

uses FPrincipal, UDataBase, UMensErro;

{$R *.DFM}

procedure TfrmCadCargoExtPCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodigoCargoExt.SetFocus;
  dblkpcmbCarreira.Text:= '';
  dblkpcmbTipoFunc.Text := '';
  dbspedJornada.Value   := 0;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurEvolFunc;
  qryDet.ParamByName('IDCARGOEXT').Value    := 0;
  qryDet.Open;

  qryGrupo.Close;
  qryGrupo.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurEvolFunc;
  qryGrupo.ParamByName('IDCARGOEXT').Value    := 0;
  qryGrupo.Open;

  qryNivel.Close;
  qryNivel.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurEvolFunc;
  qryNivel.ParamByName('IDCARGOEXT').Value    := 0;
  qryNivel.Open;

  
  qry.FieldByName('IDPESSJUR').AsInteger   := frmPrincipal.liIdPessJurEvolFunc;
  qry.FieldByName('IDCARGOEXT').AsInteger  := LeUltRegistro(nil,'CARGOEXT');

  dblkpcmbCarreira.Text      := '';
  dblkpcmbTipoFunc.Text      := '';
  dblkpcmbFuncaoCorresp.Text := '';
end;

procedure TfrmCadCargoExtPCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodigoCargoExt.SetFocus;
  if pgctrlDetalhe.ActivePage = tbsDet then
     if dbedDataInicio.CanFocus then dbedDataInicio.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsGrupo then
     if dblkpcmbGrupoFunc.CanFocus then dblkpcmbGrupoFunc.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsNivel then
     if dblkpcmbNivelFunc.CanFocus then dblkpcmbNivelFunc.SetFocus;
end;

procedure TfrmCadCargoExtPCS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count <=  0) or (MontaSelect.ValoresChave[0] = '')
  then Exit;

  qry.Close;
  qry.ParamByName('IDPESSJUR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.ParamByName('IDCARGOEXT').Value := StrToInt(MontaSelect.ValoresChave[1]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
  qryDet.Open;

  qryGrupo.Close;
  qryGrupo.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryGrupo.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
  qryGrupo.Open;

  qryNivel.Close;
  qryNivel.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryNivel.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
  qryNivel.Open;

  MontaGrids;

end;


procedure TfrmCadCargoExtPCS.CmeCadastroConfirma(Sender: TObject);
var
  ssql : string;
begin
  if qry.State = dsInsert then
  begin
    ssql:= 'SELECT CODIGO FROM CARGOEXT WHERE CODIGO = '+QuotedStr(dbedCodigoCargoExt.Text)+
           //BRUNO AZEVEDO SOL 144268 Kintana 949788
           ' AND TIPO = ''' + dbgrpCargoFuncao.Value + '''';

    With qryAux do
    begin
      sql.Clear;
      sql.Add(ssql);
      Open;
      if not IsEmpty then
      begin
        MsgDlg('Código já cadastrado.','Erro',mtError,[mbOk,mbHelp],0);
        dbedCodigoCargoExt.SetFocus;
        Abort;
      end;
    end;
  end;
  inherited;

  try
      AplicaAlteracoes([qryDet, qryGrupo, qryNivel]);
  except
     raise;
  end;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
  qryDet.Open;

  qryGrupo.Close;
  qryGrupo.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryGrupo.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
  qryGrupo.Open;

  qryNivel.Close;
  qryNivel.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryNivel.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
  qryNivel.Open;

  MontaGrids;

end; 

procedure TfrmCadCargoExtPCS.MontaGrids;
begin

  tbcDetalhe.Tabs.Clear;
  tbcDetalhe.Tabs.Add('Codificação na Patrocinadora');

  tbcDetalhe.DetDBGrids.Clear;
  tbcDetalhe.DetDBGrids.Add('dbgrdDet');
  CmeDetalhe.DataSource := dsDet;


  if (not qry.Active) or
     ((not (qry.State in [dsInsert,dsEdit])) and (qry.FieldByName('IdCargoExt').AsInteger <= 0))
  then begin
     tbcDetalhe.Tabs.Add('Níveis de Cargo');
     tbcDetalhe.DetDBGrids.Add('dbgrdNivel');
     tbsNivel.PageIndex            := 1;
     dbgrpCargoFuncao.ItemIndex    := -1;
     dbgrpAtivo.ItemIndex          := -1;

     pnlFuncao.SendToBack;
     pnlCargo.BringToFront;

  end
  else begin  
     if (qry.FieldByName('Tipo').AsString  = 'C') or (dbgrpCargoFuncao.ItemIndex = 0)  // cargo
     then begin
        tbcDetalhe.Tabs.Add('Níveis de Cargo');
        tbcDetalhe.DetDBGrids.Add('dbgrdNivel');
        tbsNivel.PageIndex       := 1;

        pnlFuncao.SendToBack;
        pnlCargo.BringToFront;

        if not qryCarreira.Active
        then qryCarreira.Open;

        if qry.FieldbyName('IDCARREIRA').AsInteger > 0
        then begin
           qryCarreira.Locate('IDCARREIRA',qry.FieldbyName('IDCARREIRA').AsInteger,[]);
           dblkpcmbCarreira.Text    := qryCarreira.FieldByName('NOME').AsString;
        end;

     end
     else begin   
        tbcDetalhe.Tabs.Add('Grupos de Função');
        tbcDetalhe.DetDBGrids.Add('dbgrdGrupo');
        tbsGrupo.PageIndex            := 1;

        pnlFuncao.BringToFront;
        pnlCargo.SendToBack;

        if not qryTipoFunc.Active
        then qryTipoFunc.Open;

        if qry.FieldbyName('IDTIPOFUNC').AsInteger > 0
        then begin
           qryTipoFunc.Locate('IDTIPOFUNC',qry.FieldbyName('IDTIPOFUNC').AsInteger,[]);
           dblkpcmbTipoFunc.Text    := qryTipoFunc.FieldByName('DESCRICAO').AsString;
        end;
     end;
  end;

end;

procedure TfrmCadCargoExtPCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim(dbedCodigoCargoExt.Text) = ''
  then  begin
     MsgDlg('Código não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
     dbedCodigoCargoExt.SetFocus;
     Abort;
  end;

  if Trim(dbedTitulo.Text) = ''
  then  begin
     MsgDlg('Título não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
     dbedTitulo.SetFocus;
     Abort;
  end;
end;

procedure TfrmCadCargoExtPCS.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet
  then begin
     if dbedDataInicio.Text = '' then
     begin
       MsgDlg('Data de Início não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
       dbedDataInicio.SetFocus;
       Abort;
     end;

     if dbedCodigo.Text = '' then
     begin
       MsgDlg('Código na Patrocinadora não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
       dbedCodigo.SetFocus;
       Abort;
     end;

     if qryDet.State = dsInsert then
     begin
       qryDet.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
       qryDet.FieldByName('IDCARGOEXT').AsInteger   := qry.FieldByName('IDCARGOEXT').AsInteger;
     end;

     qryDet.FieldbyName('DATAINICIO').AsDateTime   := Trunc(dbedDataInicio.Date);
     if Trim(dbedDataFinal.Text) <> ''
     then qryDet.FieldbyName('DATAFIM').AsDateTime := Trunc(dbedDataFinal.Date);
  end
  else if pgctrlDetalhe.ActivePage = tbsGrupo
  then begin
     if dbedInicioVigGrupo.Text = '' then
     begin
       MsgDlg('Data de Início da Vigência não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
       dbedInicioVigGrupo.SetFocus;
       Abort;
     end;


     if Trim(dblkpcmbGrupoFunc.Text) = '' then
     begin
       MsgDlg('Grupos de Função não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
       dblkpcmbGrupoFunc.SetFocus;
       Abort;
     end;

     if qryGrupo.State = dsInsert then
     begin
       qryGrupo.FieldByName('IDPESSJUR').AsInteger      := qry.FieldByName('IDPESSJUR').AsInteger;
       qryGrupo.FieldByName('IDPESSJURGRUPO').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
       qryGrupo.FieldByName('IDCARGOEXT').AsInteger     := qry.FieldByName('IDCARGOEXT').AsInteger;
     end;

     if qryGrupo.State in [dsInsert, dsEdit]
     then begin
       qryGrupo.FieldByName('CODIGO').AsString := qryGrupoFunc.FieldByName('CODIGO').AsString;
       qryGrupo.FieldByName('NOME').AsString   := qryGrupoFunc.FieldByName('NOME').AsString;
     end;
     qryGrupo.FieldbyName('DATAVIGENCIA').AsDateTime := Trunc(dbedInicioVigGrupo.Date);

     if Trim(dbedFimVigGrupo.Text) <> ''
     then qryGrupo.FieldbyName('DATAFIM').AsDateTime := Trunc(dbedFimVigGrupo.Date);
  end
  else if pgctrlDetalhe.ActivePage = tbsNivel
  then begin
     if dbedInicioVigNivel.Text = '' then
     begin
       MsgDlg('Data de Início da Vigência não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
       dbedInicioVigNivel.SetFocus;
       Abort;
     end;

     if Trim(dblkpcmbNivelFunc.Text) = '' then
     begin
       MsgDlg('Nível não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
       dblkpcmbNivelFunc.SetFocus;
       Abort;
     end;

     if qryNivel.State = dsInsert then
     begin
       qryNivel.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
       qryNivel.FieldByName('IDPESSJURNIVEL').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
       qryNivel.FieldByName('IDCARGOEXT').AsInteger   := qry.FieldByName('IDCARGOEXT').AsInteger;
     end;

     if qryNivel.State in [dsInsert, dsEdit]
     then qryNivel.FieldByName('CODIGO').AsString := qryNivelFunc.FieldByName('CODIGO').AsString;

     qryNivel.FieldbyName('DATAVIGENCIA').AsDateTime := Trunc(dbedInicioVigNivel.Date);

     if (Trim(dbedFimVigGrupo.Text) <> '') and (Trim(dbedDataFimNivel.Text) <> '')
     then qryNivel.FieldbyName('DATAFIM').AsDateTime := Trunc(dbedDataFimNivel.Date);
  end;
end;

procedure TfrmCadCargoExtPCS.dbgrpCargoFuncaoClick(Sender: TObject);
begin
  inherited;
  pgctrlDetalhe.ActivePage := tbsDet;

  if qry.State in [dsInsert, dsEdit]
  then begin
     if (dbgrpCargoFuncao.ItemIndex = 0)then
       qry.FieldByName('TIPO').AsString := 'C'
     else
       qry.FieldByName('TIPO').AsString := 'F';
     end;

  MontaGrids;

end;

procedure TfrmCadCargoExtPCS.sbtnBuscaFuncaoCorrespClick(Sender: TObject);
begin
  inherited;
  MSFuncao.Filtro.Strings[0] := ' C.IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurEvolFunc);
  MSFuncao.Executar;

  if (MSFuncao.ValoresChave.Count > 0) and (MSFuncao.ValoresChave[0] <> '')
  then if qryFuncaoCorresp.Locate('IdCargoExt',StrToInt(MSFuncao.ValoresChave[1]),[])
       then begin
          dblkpcmbFuncaoCorresp.Text := qryFuncaoCorresp.FieldByName('TITULO').AsString;
          dblkpcmbFuncaoCorresp.PerformSearch;
       end;
end;

procedure TfrmCadCargoExtPCS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  MontaGrids;
end;

procedure TfrmCadCargoExtPCS.dbedCodigoCargoExtExit(Sender: TObject);
begin
  inherited;
  if Trim(dbedCodigoCargoExt.Text) = '' then Exit;

  with qryAux do
  begin
     Close;
     SQL.Clear;

     SQL.Add(' SELECT TITULO   '+
             ' FROM   CARGOEXT '+
             ' WHERE  IDPESSJUR     = '+IntToStr(frmPrincipal.liIdPessJurEvolFunc)+
             ' AND    RTRIM(CODIGO) = '''+Trim(dbedCodigoCargoExt.Text)+'''' +
             //BRUNO AZEVEDO SOL 144268 Kintana 949788
             ' AND    TIPO = ''' + dbgrpCargoFuncao.Value + '''');

     if qry.State <> dsInsert
     then SQL.Add(' AND IDCARGOEXT <>  '+qry.FieldbyName('IDCARGOEXT').AsString);

     Open;
     if not IsEmpty
     then begin
        if dbgrpCargoFuncao.ItemIndex = 0
        then MsgDlg('Este código já está sendo utilizado para o cargo "'+FieldByName('TITULO').AsString+
                    '" e não pode ser reutilizado. Verifique. ','Erro', mtError, [mbOk],0)
        else MsgDlg('Este código já está sendo utilizado para a função "'+FieldByName('TITULO').AsString+
                    '" e não pode ser reutilizado. Verifique. ','Erro', mtError, [mbOk],0);
        dbedCodigoCargoExt.Text := '';
     end;
     Close;
  end;
end;

procedure TfrmCadCargoExtPCS.FormShow(Sender: TObject);
begin
  inherited;

  qry.Close;
  qry.ParamByName('IDPESSJUR').Value := frmPrincipal.liIdPessJurEvolFunc;
  qry.ParamByName('IDCARGOEXT').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryDet.ParamByName('IDCARGOEXT').Value  := qry.ParamByName('IDCARGOEXT').Value;
  qryDet.Open;

  qryGrupo.Close;
  qryGrupo.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryGrupo.ParamByName('IDCARGOEXT').Value  := qry.ParamByName('IDCARGOEXT').Value;
  qryGrupo.Open;

  qryNivel.Close;
  qryNivel.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryNivel.ParamByName('IDCARGOEXT').Value  := qry.ParamByName('IDCARGOEXT').Value;
  qryNivel.Open;

  qryPCS.Close;
  qryPCS.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryPCS.Open;

  qryGrupoFunc.Close;
  qryGrupoFunc.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryGrupoFunc.Open;

  qryNivelFunc.Close;
  qryNivelFunc.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryNivelFunc.Open;

  qryFuncaoCorresp.Close;
  qryFuncaoCorresp.ParamByName('IDPESSJUR').Value   := frmPrincipal.liIdPessJurEvolFunc;
  qryFuncaoCorresp.Open;

  qryCarreira.Close;
  qryCarreira.Open;

  qryTipoFunc.Close;
  qryTipoFunc.Open;

  stNomePatro.Caption := frmPrincipal.sNomePatroEvolFunc;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('CARGOEXT.IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurEvolFunc));
  MontaSelect.Filtro.Add('CARGOEXT.IDPCS     = PCS.IDPCS(+) ');

  MontaGrids;
end;



end.
