{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FAssocRubricaPlano;

interface                                                                                

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid,
  DBCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc, Menus, FTelaAut,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, MontaSelect, ImgList;

type
  TfrmAssocRubricaPlano = class(TfrmSairAjuda)
    dsPlano: TwwDataSource;
    qryPlano: TwwQuery;
    Panel4: TPanel;
    Panel5: TPanel;
    Label10: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    lblPlanPatro: TLabel;
    dblkplistPlano: TDBLookupListBox;
    dbgrdPlanPatro: TwwDBGrid;
    dsRubricaPlano: TwwDataSource;
    pmenu: TPopupMenu;
    AlterarInfoIntegra: TMenuItem;
    qryRubricaPlano: TwwQuery;
    dsProv: TwwDataSource;
    qryProv: TwwQuery;
    qryTemporaria: TwwQuery;
    updTemporaria: TUpdateSQL;
    dsTemporaria: TwwDataSource;
    qryUAux: TwwQuery;
    btnProcRXP: TBitBtn;
    btnProcProv: TBitBtn;
    MontaSqlRXP: TMontaSelect;
    MontaSqlProv: TMontaSelect;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    Panel2: TPanel;
    dbgrdPlano: TDBGrid;
    gbxOpcoes: TGroupBox;
    rbGeral: TRadioButton;
    rbAssistencial: TRadioButton;
    rbEmprestimo: TRadioButton;
    rbpatrocinadora: TRadioButton;
    rbFolhaBenef: TRadioButton;
    rbFolhafunda: TRadioButton;
    lblNome: TLabel;
    procedure sbtnAssociaClick(Sender: TObject);
    procedure dblkplistPlanoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dblkplistPlanoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dblkplistPlanoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdPlanPatroDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgrdPlanPatroDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure AlterarInfoIntegraClick(Sender: TObject);
    procedure qryPlanoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure gbxOpcoesClick(Sender: TObject);
    procedure rbGeralClick(Sender: TObject);
    procedure rbAssistencialClick(Sender: TObject);
    procedure rbEmprestimoClick(Sender: TObject);
    procedure rbpatrocinadoraClick(Sender: TObject);
    procedure rbFolhaBenefClick(Sender: TObject);
    procedure rbFolhafundaClick(Sender: TObject);
    procedure btnProcRXPClick(Sender: TObject);
    procedure btnProcProvClick(Sender: TObject);
    procedure wwDBGrid2TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    iIdPlanoPrev : integer;
    sTpRubrica : string;
    procedure AbreQuerys;
  public
    { Public declarations }
  end;

var
  frmAssocRubricaPlano: TfrmAssocRubricaPlano;

implementation

uses UMensErro, FLerInfoIntegra, uIntegraBack, DIntegracao,
     DFolha, USistema, fAguarde, uObjFolha;

{$R *.DFM}


procedure TfrmAssocRubricaPlano.sbtnAssociaClick(Sender: TObject);
var
  sSQL, sTipoProv : string;
begin
  inherited;
  frmLerInfoIntegra := TfrmLerInfoIntegra.Create(Application);
  frmLerInfoIntegra.cmContaAssoc.Mascara  := IntegraBack.MascaraPlano;
  frmLerInfoIntegra.cmContaAssoc.Plano    := IntegraBack.Plano;

  frmLerInfoIntegra.iFlgDesconto           := qryProv.FieldByName('FLGDESCONTO').AsInteger;
  frmLerInfoIntegra.iObrigaFavorec         := qryProv.FieldByName('FLGOBRIGAFAVOREC').AsInteger;
  if frmLerInfoIntegra.iFlgDesconto=0 Then
     sTipoProv := ' {Provento}'
  else
     sTipoProv := ' {Desconto}';
  frmLerInfoIntegra.iIdPlanoPrev        := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  frmLerInfoIntegra.lblPlano.Caption    := 'Plano  : ' + qryPlano.FieldByName('Plano').AsString;
  If SistemaFolha.FlgUsaCodRubExt = 0 then
     frmLerInfoIntegra.lblProvento.Caption := 'Rubrica: ' + qryProv.FieldByName('Descricao').AsString + sTipoProv
  else
     frmLerInfoIntegra.lblProvento.Caption := 'Rubrica: ' + qryProv.FieldByName('DESCRPROVDESC').AsString + sTipoProv;

  with qryTemporaria do begin
       Close;
       ParamByName('IdPessJur').AsInteger   := qryPlano.FieldbyName('IdPessJur').AsInteger;
       ParamByName('IdRubrica').AsInteger   := qryProv.FieldbyName('IDPROVENTO').AsInteger;
       ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldbyName('IdPlanoPrev').AsInteger;
       Open;
  end;
  qryTemporaria.Insert;
  frmLerInfoIntegra.lkcmbDescAtividade.Text   := '';
  frmLerInfoIntegra.dblkpcmbPortForma.Text    := '';
  frmLerInfoIntegra.cmbCCusto.Text            := '';
  frmLerInfoIntegra.lbDescricaoCCusto.Caption := '';
  frmLerInfoIntegra.cmbCCusto.Text            := '';
  frmLerInfoIntegra.lbDescricaoCCusto.Caption := '';
  // Carrega os valores default do Plano
  with QryUAux do begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT CODTIPRECDES,RECPAG,IDEMPRESAPROP FROM PLANPREV ' +
                      'WHERE  IDPLANOPREV = ' + IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger));
       Open;
  end;
  if not qryUAux.IsEmpty then begin
    frmLerInfoIntegra.sCodTipRecDes := qryUAux.FieldByName('CodTipRecDes').AsString;
    frmLerInfoIntegra.sRecPag       := qryUAux.FieldByName('RecPag').AsString;
    frmLerInfoIntegra.sIdPessoa     := qryUAux.FieldByName('IdEmpresaProp').AsString;
  end;
  qryUAux.Close;

  frmLerInfoIntegra.ShowModal;

  if frmLerInfoIntegra.bOk then begin
     // Gravar rubrica por plano
     dtmFolha.qryAux.Close;
     dtmFolha.qryAux.SQL.Clear;
     sSQL := 'INSERT INTO RUBRICAXPLANO ' +
             '(IDPESSJUR,IDRUBRICA,IDPLANOPREV,CODTIPRECDES, ' +
             ' RECPAG,IDPESSOA,CODTIPRECDESFAV,CODTIPRECDESCAR, '+
             ' CODTIPRECDESFAVCAR,CODPORTFORMA,CODCENTRORESPON, '+
             ' CODCENTROCUSTOD,IDEMPRESA,CODCENTROCUSTOC,PLACONTAD, '+
             ' PLANO,PLACONTAC,UNIDNEGOC,IDEMPRESAPROP, CODSUBCONTA) '+
             ' VALUES('+qryPlano.FieldbyName('IdPessJur').AsString+', '+
                        qryProv.FieldbyName('IDPROVENTO').AsString+', '+
                        qryPlano.FieldByName('IdPlanoPrev').AsString+', ';

     if frmLerInfoIntegra.sCodTipRecDes <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodTipRecDes + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sRecPag <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sRecPag + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sIdPessoa <> ''
     then sSQL := sSQL +  frmLerInfoIntegra.sIdPessoa + ', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodTipRecDesFav <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodTipRecDesFav + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodTipRecDesCar <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodTipRecDesCar + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodTipRecDesFavCar <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodTipRecDesFavCar + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodPortForma <> ''
     then sSQL := sSQL + frmLerInfoIntegra.sCodPortForma + ', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodCentroRespon <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodCentroRespon + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodCentroCustoD <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodCentroCustoD + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sIdEmpresa <> ''
     then sSQL := sSQL + frmLerInfoIntegra.sIdEmpresa + ', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sCodCentroCustoC <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sCodCentroCustoC + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sPlaContaD <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sPlaContaD + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sPlano <> ''
     then sSQL := sSQL + frmLerInfoIntegra.sPlano + ', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sPlaContaC <> ''
     then sSQL := sSQL + '''' + frmLerInfoIntegra.sPlaContaC + ''', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sUnidNegoc <> ''
     then sSQL := sSQL + frmLerInfoIntegra.sUnidNegoc + ', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.sIdEmpresaProp <> ''
     then sSQL := sSQL + frmLerInfoIntegra.sIdEmpresaProp + ', '
     else sSQL := sSQL + 'NULL, ';

     if frmLerInfoIntegra.ssubConta <> ''
     then sSQL := sSQL + frmLerInfoIntegra.ssubConta
     else sSQL := sSQL + 'NULL ';


     sSQL := sSQL + ')';

     dtmFolha.qryAux.SQL.Add(sSQL);

     try
        dtmFolha.qryAux.ExecSQL;
     except
        on E: EDBEngineError do begin
           MostrarErro(E);
           Exit;
        end;
     end;
  end;

  AbreQuerys;
  qryTemporaria.CancelUpdates;
  frmLerInfoIntegra.cmContaAssoc.Clear; 
  frmLerInfoIntegra.Free;
end; // sbtnAssociaClick

procedure TfrmAssocRubricaPlano.sbtnAssociaTodosClick(Sender: TObject);
var
  sSQL : string;
begin
  inherited;
  frmLerInfoIntegra := TfrmLerInfoIntegra.Create(Application);
  qryProv.First;
  while not qryProv.Eof do
  begin
     with frmLerInfoIntegra do
     begin
        lblPlano.Caption := 'Plano: '+qryPlano.FieldByName('Plano').AsString;
        iIdPlanoPrev := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
        If SistemaFolha.FlgUsaCodRubExt = 0 then
           lblProvento.Caption := 'Rubrica: '+qryProv.FieldByName('Descricao').AsString
        else
            lblProvento.Caption := 'Rubrica: '+qryProv.FieldByName('Descrprovdesc').AsString;
        ShowModal;
        if bOk
        then begin
               // Gravar rubrica por plano
               dtmFolha.qryAux.Close;
               dtmFolha.qryAux.SQL.Clear;
               sSQL := 'INSERT INTO RUBRICAXPLANO ' +
                       '(IDPESSJUR,IDRUBRICA,IDPLANOPREV,CODTIPRECDES, ' +
                       ' RECPAG,IDPESSOA,CODTIPRECDESFAV,CODTIPRECDESCAR, '+
                       ' CODTIPRECDESFAVCAR,CODPORTFORMA,CODCENTRORESPON, '+
                       ' CODCENTROCUSTOD,IDEMPRESA,CODCENTROCUSTOC,PLACONTAD, '+
                       ' PLANO,PLACONTAC,UNIDNEGOC,IDEMPRESAPROP,CODSUBCONTA) '+
                       ' VALUES('+qryPlano.FieldbyName('IdFundacao').AsString+', '+
                                  qryProv.FieldbyName('IDPROVENTO').AsString+', '+
                                  qryPlano.FieldByName('IdPlanoPrev').AsString+', ';

               if sCodTipRecDes <> ''
               then sSQL := sSQL + '''' + sCodTipRecDes + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sRecPag <> ''
               then sSQL := sSQL + '''' + sRecPag + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sIdPessoa <> ''
               then sSQL := sSQL +  sIdPessoa + ', '
               else sSQL := sSQL + 'NULL, ';

               if sCodTipRecDesFav <> ''
               then sSQL := sSQL + '''' + sCodTipRecDesFav + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sCodTipRecDesCar <> ''
               then sSQL := sSQL + '''' + sCodTipRecDesCar + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sCodTipRecDesFavCar <> ''
               then sSQL := sSQL + '''' + sCodTipRecDesFavCar + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sCodPortForma <> ''
               then sSQL := sSQL + sCodPortForma + ', '
               else sSQL := sSQL + 'NULL, ';

               if sCodCentroRespon <> ''
               then sSQL := sSQL + '''' + sCodCentroRespon + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sCodCentroCustoD <> ''
               then sSQL := sSQL + '''' + sCodCentroCustoD + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sIdEmpresa <> ''
               then sSQL := sSQL + sIdEmpresa + ', '
               else sSQL := sSQL + 'NULL, ';

               if sCodCentroCustoC <> ''
               then sSQL := sSQL + '''' + sCodCentroCustoC + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sPlaContaD <> ''
               then sSQL := sSQL + '''' + sPlaContaD + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sPlano <> ''
               then sSQL := sSQL + sPlano + ', '
               else sSQL := sSQL + 'NULL, ';

               if sPlaContaC <> ''
               then sSQL := sSQL + '''' + sPlaContaC + ''', '
               else sSQL := sSQL + 'NULL, ';

               if sUnidNegoc <> ''
               then sSQL := sSQL + sUnidNegoc + ', '
               else sSQL := sSQL + 'NULL, ';

               if sIdEmpresaProp <> ''
               then sSQL := sSQL + sIdEmpresaProp
               else sSQL := sSQL + 'NULL ';

               if ssubConta <> ''
               then sSQL := sSQL + ssubConta
               else sSQL := sSQL + 'NULL ';

               sSQL := sSQL + ')';

               dtmFolha.qryAux.SQL.Add(sSQL);

               try
                  dtmFolha.qryAux.ExecSQL;
               except
                  on E: EDBEngineError do begin
                     MostrarErro(E);
                     Exit;
                  end;
               end;

             end;
     end;
     qryProv.Next;
  end; { while }
  AbreQuerys;
  frmLerInfoIntegra.Free;
end; // sbtnAssociaTodosClick

procedure TfrmAssocRubricaPlano.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Desassociando Rubrica ...');
  frmAguarde.Refresh;

  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.SQL.Clear;
  dtmFolha.qryAux.SQL.Add(' DELETE RUBRICAXPLANO'+
                             ' WHERE  IDRUBRICA = '+qryRubricaPlano.FieldByName('IdRubrica').AsString+
                             ' AND    IDPESSJUR = '+qryRubricaPlano.FieldByName('IdPessJur').AsString+
                             ' AND    IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString);
  try
     dtmFolha.qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        frmAguarde.Apaga;
        Exit;
     end;
  end;
  frmLerInfoIntegra := TfrmLerInfoIntegra.Create(Application);
  with frmLerInfoIntegra do
  begin
    sCodCentroRespon   := '';
    sIdPessoa          := '';
    sCodPortForma      := '';
    sCodTipRecDes      := '';
    sRecPag            := '';
    sUnidNegoc         := '';
    sIdEmpresaProp     := '';
    sIdEmpresa         := '';
    sCodCentroCustoC   := '';
    sCodCentroCustoD   := '';
    sPlano             := '';
    sPlaContaC         := '';
    sPlaContaD         := '';
    sCodTipRecDesFav   := '';
    sCodTipRecDesCar   := '';
    sCodTipRecDesFavCar:= '';
    sSubConta          := '';
  end;

  AbreQuerys;
  frmLerInfoIntegra.Free;
  frmAguarde.Apaga;
end; // sbtnDesassociaClick

procedure TfrmAssocRubricaPlano.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Desassociando todas as rubricas ...');
  frmAguarde.Refresh;

  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.SQL.Clear;
  dtmFolha.qryAux.SQL.Add(' DELETE RUBRICAXPLANO   ' +
                          ' WHERE IDPLANOPREV  = ' + qryPlano.FieldByName('IdPlanoPrev').AsString);
  try
     dtmFolha.qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        frmAguarde.Apaga;
        Exit;
     end;
  end;
  frmLerInfoIntegra := TfrmLerInfoIntegra.Create(Application);
  with frmLerInfoIntegra do
  begin
    sCodCentroRespon   := '';
    sIdPessoa          := '';
    sCodPortForma      := '';
    sCodTipRecDes      := '';
    sCodTipRecDesFav   := '';
    sCodTipRecDesCar   := '';
    sCodTipRecDesFavCar:= '';
    sRecPag            := '';
    sUnidNegoc         := '';
    sIdEmpresaProp     := '';
    sIdEmpresa         := '';
    sCodCentroCustoC   := '';
    sCodCentroCustoD   := '';
    sPlano             := '';
    sPlaContaC         := '';
    sPlaContaD         := '';
    sSubConta          := '';
  end;

  AbreQuerys;
  frmLerInfoIntegra.Free;
  frmAguarde.Apaga;
end; // sbtnDesassociaTodosClick

procedure TfrmAssocRubricaPlano.dblkplistPlanoDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  { Este método é executado quando o usuario clica na lista de
    Planos JA associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto retornar o Accept = True, este método é executado. }

  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);

end; // dblkplistPlanoDragDrop

procedure TfrmAssocRubricaPlano.dblkplistPlanoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = list
    Source = grid ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryRubricaPlano.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end; // dblkplistPlanoDragOver

procedure TfrmAssocRubricaPlano.dblkplistPlanoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox
  then TDBLookUplistBox(Sender).BeginDrag(True);
end; // dblkplistPlanoMouseDown

procedure TfrmAssocRubricaPlano.dbgrdPlanPatroDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  { = Associa Click }
  { Este método é executado quando o usuario clica na lista de
    Planos nao associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto(dblkplistPlanPatro) retornar o Accept = True, este método
    é executado.}
  TdbLookUpListBox(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end; // dbgrdPlanPatroDragDrop

procedure TfrmAssocRubricaPlano.dbgrdPlanPatroDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = grid
    Source = list ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryRubricaPlano.Active) then Exit;

  if (Source is TDBLookUpListBox)
  then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end; // dbgrdPlanPatroDragOver

procedure TfrmAssocRubricaPlano.dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end; // dbgrdPlanPatroMouseDown

procedure TfrmAssocRubricaPlano.AlterarInfoIntegraClick(Sender: TObject);
var
  sSQL, sTipoProv : string;
begin
  inherited;
  frmLerInfoIntegra := TfrmLerInfoIntegra.Create(Application);
  frmLerInfoIntegra.cmContaAssoc.Mascara  := IntegraBack.MascaraPlano;
  frmLerInfoIntegra.cmContaAssoc.Plano    := IntegraBack.Plano;

  qryTemporaria.Close;
  qryTemporaria.ParamByName('IdPessJur').AsInteger   := qryPlano.FieldbyName('IdPessJur').AsInteger;
  qryTemporaria.ParamByName('IdRubrica').AsInteger   := qryRubricaPlano.FieldbyName('IdRubrica').AsInteger;
  qryTemporaria.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldbyName('IdPlanoPrev').AsInteger;
  qryTemporaria.Open;

  qryTemporaria.Edit;
  iIdPlanoPrev      := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  with frmLerInfoIntegra do begin
       iFlgDesconto        := qryRubricaPlano.FieldByName('FLGDESCONTO').AsInteger;
       iObrigaFavorec      := qryRubricaPlano.FieldByName('FLGOBRIGAFAVOREC').AsInteger;
       if iFlgDesconto=0 Then
          sTipoProv := ' {Provento}'
       else
           sTipoProv := ' {Desconto}';
       lblPlano.Caption    := 'Plano  : ' + qryPlano.FieldByName('Plano').AsString;
       lblProvento.Caption := 'Rubrica: ' + qryRubricaPlano.FieldByName('Descricao').AsString + sTipoProv;
       sCodCentroRespon    := qryRubricaPlano.FieldByName('CODCENTRORESPON').AsString;
       sIdPessoa           := qryRubricaPlano.FieldByName('IDPESSOA').AsString;
       sCodPortForma       := qryRubricaPlano.FieldByName('CODPORTFORMA').AsString;
       sCodTipRecDes       := qryRubricaPlano.FieldByName('CODTIPRECDES').AsString;
       sCodTipRecDesFav    := qryRubricaPlano.FieldByName('CODTIPRECDESFAV').AsString;
       sCodTipRecDesCar    := qryRubricaPlano.FieldByName('CODTIPRECDESCAR').AsString;
       sCodTipRecDesFavCar := qryRubricaPlano.FieldByName('CODTIPRECDESFAVCAR').AsString;
       sRecPag             := qryRubricaPlano.FieldByName('RECPAG').AsString;
       sUnidNegoc          := qryRubricaPlano.FieldByName('UNIDNEGOC').AsString;
       sIdEmpresaProp      := qryRubricaPlano.FieldByName('IDEMPRESAPROP').AsString;
       sIdEmpresa          := qryRubricaPlano.FieldByName('IDEMPRESA').AsString;
       sCodCentroCustoC    := qryRubricaPlano.FieldByName('CODCENTROCUSTOC').AsString;
       sCodCentroCustoD    := qryRubricaPlano.FieldByName('CODCENTROCUSTOD').AsString;
       sPlano              := qryRubricaPlano.FieldByName('PLANO').AsString;
       sPlaContaC          := qryRubricaPlano.FieldByName('PLACONTAC').AsString;
       sPlaContaD          := qryRubricaPlano.FieldByName('PLACONTAD').AsString;
       sSubConta           := InttoStr(qryRubricaPlano.FieldByName('CODSUBCONTA').AsInteger);
       ShowModal;
       if bOk then begin
          // Atualiza rubrica por plano
          sSQL := 'UPDATE RUBRICAXPLANO SET ';
          sSQL := sSQL + 'CODTIPRECDES = ';
          if sCodTipRecDes <> '' then sSQL := sSQL + '''' + sCodTipRecDes + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'RECPAG = ';
          if sRecPag <> '' then sSQL := sSQL + '''' + sRecPag + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'IDPESSOA = ';
          if sIdPessoa <> '' then sSQL := sSQL + sIdPessoa + ', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODTIPRECDESFAV = ';
          if sCodTipRecDesFav <> '' then sSQL := sSQL + '''' + sCodTipRecDesFav + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODTIPRECDESCAR = ';
          if sCodTipRecDesCar <> '' then sSQL := sSQL + '''' + sCodTipRecDesCar + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODTIPRECDESFAVCAR = ';
          if sCodTipRecDesFavCar <> '' then sSQL := sSQL + '''' + sCodTipRecDesFavCar + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODPORTFORMA = ';
          if sCodPortForma <> '' then sSQL := sSQL + sCodPortForma + ', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODCENTRORESPON = ';
          if sCodCentroRespon <> '' then sSQL := sSQL + '''' + sCodCentroRespon + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODCENTROCUSTOD = ';
          if sCodCentroCustoD <> '' then sSQL := sSQL + '''' + sCodCentroCustoD + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'IDEMPRESA = ';
          if sIdEmpresa <> '' then sSQL := sSQL + sIdEmpresa + ', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODSUBCONTA = ';
          if ssubConta <> '' then sSQL := sSQL + ssubConta + ', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'CODCENTROCUSTOC = ';
          if sCodCentroCustoC <> '' then sSQL := sSQL + '''' + sCodCentroCustoC + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'PLACONTAD = ';
          if sPlaContaD <> '' then sSQL := sSQL + '''' + sPlaContaD + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'PLANO = ';
          if sPlano <> '' then sSQL := sSQL + sPlano + ', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'PLACONTAC = ';
          if sPlaContaC <> '' then sSQL := sSQL + '''' + sPlaContaC + ''', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'UNIDNEGOC = ';
          if sUnidNegoc <> '' then sSQL := sSQL + sUnidNegoc + ', '
             else sSQL := sSQL + 'NULL, ';

          sSQL := sSQL + 'IDEMPRESAPROP = ';
          if sIdEmpresaProp <> '' then sSQL := sSQL + sIdEmpresaProp
             else sSQL := sSQL + 'NULL ';

          sSQL := sSQL + ' WHERE IDPESSJUR   = '+qryRubricaPlano.FieldbyName('IdPessJur').AsString+
                       ' AND   IDPLANOPREV = '+qryRubricaPlano.FieldByName('IdPlanoPrev').AsString+
                       ' AND   IDRUBRICA   = '+qryRubricaPlano.FieldByName('IdRubrica').AsString;

          dtmFolha.qryAux.Close;
          dtmFolha.qryAux.SQL.Clear;
          dtmFolha.qryAux.SQL.Add(sSQL);
          try
             dtmFolha.qryAux.ExecSQL;
          except
                on E: EDBEngineError do begin
                   MostrarErro(E);
                   Exit;
                end;
          end;
       end;
  end;
  AbreQuerys;
  frmLerInfoIntegra.cmContaAssoc.Clear; 
  frmLerInfoIntegra.Free;
end; // AlterarInfoIntegraClick

procedure TfrmAssocRubricaPlano.qryPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if dbgrdPlano.SelectedRows = nil then
     qryPlano.First;

  AbreQuerys;

  sbtnAssocia.Enabled := True;
  sbtnAssociaTodos.Enabled :=  True;
  sbtnDesassocia.Enabled := True;
  sbtnDesassociaTodos.Enabled := True;

  lblPlanPatro.Caption := 'Rubricas do Plano '+Trim(qryPlano.FieldByName('Plano').AsString);


end; // qryPlanoAfterScroll

procedure TfrmAssocRubricaPlano.AbreQuerys;
begin
  qryProv.Close;
  qryProv.sql.clear;
  qryprov.sql.Text := 'SELECT  '+
                      'P.IDPROVENTO, '+
                      'P.CODPROVDESC, '+
                      'P.DESCRICAO, '+
                      'P.DESCRPROVDESC, '+
                      'P.FLGTPRUBRICA, '+
                      'FLGDESCONTO, '+
                      'FLGOBRIGAFAVOREC '+
                      'FROM '+
                      'PROVDESC P '+
                      'WHERE '+
                      'IDPROVENTO NOT IN '+
                      '(SELECT DISTINCT IDRUBRICA '+
                      'FROM RUBRICAXPLANO RP '+
                      'WHERE RP.IDPESSJUR = ' + IntToStr(qryPlano.FieldbyName('IdPessjur').AsInteger)   + ' '+
                      'AND RP.IDPLANOPREV = ' + IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger) + ' ' +
                      'AND RP.IDRUBRICA = P.IDPROVENTO) '+
                      'AND FLGTPRUBRICA like '+ QuotedStr(sTpRubrica) +
                      ' ORDER BY P.CODPROVDESC ';

  qryProv.Open;

  qryRubricaPlano.Close;
  qryRubricaPlano.sql.clear;
  qryRubricaPlano.sql.text := 'SELECT RPL.IDPESSJUR, '+
                                    'RPL.IDRUBRICA, '+
                                    'RPL.IDPLANOPREV, '+
                                    'RPL.CODCENTROCUSTOD, '+
                                    'RPL.UNIDNEGOC, '+
                                    'RPL.IDEMPRESAPROP, '+
                                    'RPL.IDEMPRESA, '+
                                    'RPL.CODTIPRECDES, '+
                                    'RPL.IDPESSOA, '+
                                    'RPL.CODCENTROCUSTOC, '+
                                    'RPL.RECPAG, '+
                                    'RPL.PLACONTAD, '+
                                    'RPL.PLANO, '+
                                    'RPL.PLACONTAC, '+
                                    'RPL.CODPORTFORMA, '+
                                    'RPL.CODCENTRORESPON, '+
                                    'P.DESCRICAO, '+
                                    'P.CODPROVDESC, '+
                                    'P.DESCRPROVDESC, '+
                                    'P.FLGDESCONTO, '+
                                    'RPL.CODTIPRECDESFAV , '+
                                    'RPL.CODTIPRECDESCAR , '+
                                    'RPL.CODTIPRECDESFAVCAR , '+
                                    'P.FLGOBRIGAFAVOREC, '+
                                    'RPL.CODSUBCONTA  '+
                                    'FROM RUBRICAXPLANO RPL, PROVDESC P '+
                                    'WHERE RPL.IDPESSJUR = '+IntToStr(qryPlano.FieldbyName('IdPessjur').AsInteger) + ' '+
                                    'AND RPL.IDPLANOPREV = '+IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger)+' '+
                                    'AND P.IDPROVENTO = RPL.IDRUBRICA '+
                                    'AND P.FLGTPRUBRICA LIKE ' + QuotedStr(sTpRubrica) +
                                    ' ORDER BY RPL.IDRUBRICA ';
  qryRubricaPlano.Open;
end;

procedure TfrmAssocRubricaPlano.FormShow(Sender: TObject);
begin
  inherited;
  sTpRubrica:='%B%';
  qryPlano.Close;
  qryPlano.Open;
  AbreQuerys;
end;

procedure TfrmAssocRubricaPlano.gbxOpcoesClick(Sender: TObject);
begin
  inherited;
   If rbgeral.checked then
      sTpRubrica := '%G%';
   If rbAssistencial.checked then
      sTpRubrica := '%A%';
   If rbEmprestimo.checked then
      sTpRubrica := '%E%';
   If rbPatrocinadora.checked then
      sTpRubrica := '%P%';
   If rbFolhaBenef.checked then
      sTpRubrica := '%B%';
   If rbFolhaFunda.checked then
      sTpRubrica := '%F%';

  AbreQuerys;
end;

procedure TfrmAssocRubricaPlano.rbGeralClick(Sender: TObject);
begin
  inherited;
  gbxOpcoesClick(self);
end;

procedure TfrmAssocRubricaPlano.rbAssistencialClick(Sender: TObject);
begin
  inherited;
  gbxOpcoesClick(self);
end;

procedure TfrmAssocRubricaPlano.rbEmprestimoClick(Sender: TObject);
begin
  inherited;
  gbxOpcoesClick(self);
end;

procedure TfrmAssocRubricaPlano.rbpatrocinadoraClick(Sender: TObject);
begin
  inherited;
  gbxOpcoesClick(self);
end;

procedure TfrmAssocRubricaPlano.rbFolhaBenefClick(Sender: TObject);
begin
  inherited;
   gbxOpcoesClick(self);
end;

procedure TfrmAssocRubricaPlano.rbFolhafundaClick(Sender: TObject);
begin
  inherited;
  gbxOpcoesClick(self);
end;

procedure TfrmAssocRubricaPlano.btnProcRXPClick(Sender: TObject);
begin
  inherited;
  MontaSqlRXP.Filtro.Clear;
  MontaSqlRXP.Filtro.Add('RPL.IDPESSJUR = ' + IntToStr(qryPlano.FieldbyName('IdPessjur').AsInteger) + ' '+
                         'AND RPL.IDPLANOPREV = '+IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger)+' '+
                         'AND P.IDPROVENTO = RPL.IDRUBRICA '+
                         'AND P.FLGTPRUBRICA LIKE ' + QuotedStr(sTpRubrica));
  MontaSqlRXP.Executar;
  If MontaSqlRXP.RetornouValor Then
    qryRubricaPlano.Locate('IDRUBRICA', MontaSqlRXP.ValoresChave[1],[]);
end;

procedure TfrmAssocRubricaPlano.btnProcProvClick(Sender: TObject);
begin
  inherited;
  MontaSqlProv.Filtro.Clear;
  MontaSqlProv.Filtro.Add( 'P.IDPROVENTO NOT IN '+
                           '(SELECT DISTINCT '+
                           'RP.IDRUBRICA '+
                           'FROM RUBRICAXPLANO RP '+
                           'WHERE RP.IDPESSJUR = ' + IntToStr(qryPlano.FieldbyName('IdPessjur').AsInteger)   + ' '+
                           'AND RP.IDPLANOPREV = ' + IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger) + ' ' +
                           'AND RP.IDRUBRICA = P.IDPROVENTO) '+
                           'AND FLGTPRUBRICA like '+ QuotedStr(sTpRubrica));
  MontaSqlProv.Executar;
  If MontaSqlProv.RetornouValor Then
    qryProv.Locate('IDPROVENTO', MontaSqlProv.ValoresChave[0],[]);
end;

procedure TfrmAssocRubricaPlano.wwDBGrid2TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  qryRubricaPlano.Close;
  qryRubricaPlano.Sql.Clear;
  qryRubricaPlano.sql.text := 'SELECT RPL.IDPESSJUR, '+
                              'RPL.IDRUBRICA, '+
                              'RPL.IDPLANOPREV, '+
                              'RPL.CODCENTROCUSTOD, '+
                              'RPL.UNIDNEGOC, '+
                              'RPL.IDEMPRESAPROP, '+
                              'RPL.IDEMPRESA, '+
                              'RPL.CODTIPRECDES, '+
                              'RPL.IDPESSOA, '+
                              'RPL.CODCENTROCUSTOC, '+
                              'RPL.RECPAG, '+
                              'RPL.PLACONTAD, '+
                              'RPL.PLANO, '+
                              'RPL.PLACONTAC, '+
                              'RPL.CODPORTFORMA, '+
                              'RPL.CODCENTRORESPON, '+
                              'P.DESCRICAO, '+
                              'P.CODPROVDESC, '+
                              'P.DESCRPROVDESC, '+
                              'P.FLGDESCONTO, '+
                              'RPL.CODTIPRECDESFAV , '+
                              'RPL.CODTIPRECDESCAR , '+
                              'RPL.CODTIPRECDESFAVCAR , '+
                              'P.FLGOBRIGAFAVOREC, '+
                              'RPL.CODSUBCONTA  '+
                              'FROM RUBRICAXPLANO RPL, PROVDESC P '+
                              'WHERE RPL.IDPESSJUR = '+IntToStr(qryPlano.FieldbyName('IdPessjur').AsInteger) + ' '+
                              'AND RPL.IDPLANOPREV = '+IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger)+' '+
                              'AND P.IDPROVENTO = RPL.IDRUBRICA '+
                              'AND P.FLGTPRUBRICA LIKE ' + QuotedStr(sTpRubrica) +
                              ' ORDER BY ' + AFieldName;
  qryRubricaPlano.Open;
end;

procedure TfrmAssocRubricaPlano.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  qryProv.Close;
  qryProv.sql.clear;
  qryprov.sql.Text := 'SELECT  '+
                      'P.IDPROVENTO, '+
                      'P.CODPROVDESC, '+
                      'P.DESCRICAO, '+
                      'P.DESCRPROVDESC, '+
                      'P.FLGTPRUBRICA, '+
                      'FLGDESCONTO, '+
                      'FLGOBRIGAFAVOREC '+
                      'FROM '+
                      'PROVDESC P '+
                      'WHERE '+
                      'IDPROVENTO NOT IN '+
                      '(SELECT DISTINCT IDRUBRICA '+
                      'FROM RUBRICAXPLANO RP '+
                      'WHERE RP.IDPESSJUR = ' + IntToStr(qryPlano.FieldbyName('IdPessjur').AsInteger)   + ' '+
                      'AND RP.IDPLANOPREV = ' + IntToStr(qryPlano.FieldbyName('IdPlanoPrev').AsInteger) + ' ' +
                      'AND RP.IDRUBRICA = P.IDPROVENTO) '+
                      'AND FLGTPRUBRICA like '+ QuotedStr(sTpRubrica) +
                      ' ORDER BY ' + AFieldName ;

  qryProv.Open;
end;

end.
{==============================================================================|
| UNIT: FASSOCRUBRICAPLANO                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE PARAMETRIZAÇÃO CONTABIL E ASSOCIAÇÃO DE RUBRICAS POR PLANO     |
|   PREVIDENCIARIO                                                             |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/02/2002 A 04/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12C                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACERTO NO FILTRO DA QUERY qryRubricaPlano , QUANDO A FUNDAÇÃO TRABALHAR    |
|   COM CODIGO E DESCRIÇÃO EXTERNA DAS RUBRICAS                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/02/2002 A 26/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12D                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NOS GRIDS DE RUBRICAS DO PLANO E RUBRICAS NÃO ASSOCIADAS , PARA  |
|   DEMONSTRAR OS CODIGOS INTERNOS E AS DESCRIÇÕES INTERNAS DAS RUBRICAS       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/06/2002 A 04/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12L                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  TORNAR VISÍVEL OS BOTÕES BTNPROVRXP E BTNPROVPROV E COLOCAR OS MONTASELECTS |
|  PARA FUNCIONAR                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/12/2002 A 19/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 10599.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração para gravar dois novos campos na tabe- |
|  la RubricaxPlano (CODTIPRECDESCAR, CODTIPRECDESFAVCAR).                     |
|==============================================================================}

