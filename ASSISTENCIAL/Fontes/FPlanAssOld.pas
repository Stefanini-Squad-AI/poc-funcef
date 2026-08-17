unit FPlanAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDet, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, DBCtrls, MAHlpBtn,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ComCtrls, ExtCtrls, Mask,
  DBTables, Wwquery, wwdbedit, wwdblook, Wwtable, Wwdbspin, Menus,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmPlanAss = class(TfrmCadMestreDetalhe)
    qryPrinc: TwwQuery;
    qryContribAss: TwwQuery;
    qryLer: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit1: TDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBEdit2: TwwDBEdit;
    tbRegra: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    cmbregra4: TwwDBLookupCombo;
    cmbregra5: TwwDBLookupCombo;
    cmbregra6: TwwDBLookupCombo;
    btnRegra1: TBitBtn;
    qryRegra: TwwQuery;
    dsregra: TwwDataSource;
    Label10: TLabel;
    Label17: TLabel;
    lblperiod: TLabel;
    Label14: TLabel;
    Rgpsel: TRadioGroup;
    DBEdit2: TDBEdit;
    cmbFormaPag: TwwDBLookupCombo;
    cmbRubNormal: TwwDBLookupCombo;
    qryContrib: TwwQuery;
    dscontribuicao: TwwDataSource;
    qryPortForm: TwwQuery;
    dsportform: TwwDataSource;
    qryProvento: TwwQuery;
    dsprovento: TwwDataSource;
    qryAux: TwwQuery;
    qryServCmb: TwwQuery;
    dsservcmb: TwwDataSource;
    qryTpServAss: TwwQuery;
    dstpservass: TwwDataSource;
    cmbContrib: TwwDBLookupCombo;
    qryFornServAss: TwwQuery;
    dsTipoDocCAP: TwwDataSource;
    dsTpDesemb: TwwDataSource;
    qryTipoDocCAR: TwwQuery;
    dsTipoDocCAR: TwwDataSource;
    qryTipoDocCAP: TwwQuery;
    qryTpDesemb: TwwQuery;
    qryTpDesembCODTIPRECDES: TStringField;
    qryTpDesembDESCRICAO: TStringField;
    qryTpDesembANASINT: TStringField;
    dsTpReceb: TwwDataSource;
    qryTpReceb: TwwQuery;
    qryTpRecebCODTIPRECDES: TStringField;
    qryTpRecebDESCRICAO: TStringField;
    qryTpRecebANASINT: TStringField;
    Label22: TLabel;
    spinpri: TwwDBSpinEdit;
    listAux: TListBox;
    qryAux2: TwwQuery;
    qryMascara: TwwQuery;
    DBCkboxevento: TDBCheckBox;
    btnCons: TSpeedButton;
    qryProdAss: TwwQuery;
    cmbRubAtraso: TwwDBLookupCombo;
    cmbRubDevolucao: TwwDBLookupCombo;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    qryUSistema: TwwQuery;
    btnGerarRubricas: TBitBtn;
    SpeedButton1: TSpeedButton;
    spbLimpa6: TSpeedButton;
    spbLimpa5: TSpeedButton;
    spbLimpa7: TSpeedButton;
    rgFlgCobCarne: TRadioGroup;
    Label21: TLabel;
    GroupBox3: TGroupBox;
    cmbRegraContrib: TwwDBLookupCombo;
    cmbTipoRegraContrib: TwwDBLookupCombo;
    qryTipoRegra: TwwQuery;
    qryTipoRegraAux: TwwQuery;
    qryRegra1: TwwQuery;
    qryTiporegra1: TwwQuery;
    qryTipoRegra2: TwwQuery;
    qryTipoRegra3: TwwQuery;
    qryTipoRegra7: TwwQuery;
    qryRegra2: TwwQuery;
    qryRegra3: TwwQuery;
    qryRegra7: TwwQuery;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    spbLimpa1: TSpeedButton;
    cmbTipoRegra1: TwwDBLookupCombo;
    cmbRegra1: TwwDBLookupCombo;
    GroupBox7: TGroupBox;
    spbLimpa2: TSpeedButton;
    cmbTipoRegra2: TwwDBLookupCombo;
    cmbregra2: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    spbLimpa4: TSpeedButton;
    cmbTipoRegra7: TwwDBLookupCombo;
    cmbregra7: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    spbLimpa3: TSpeedButton;
    cmbTipoRegra3: TwwDBLookupCombo;
    cmbregra3: TwwDBLookupCombo;
    DBCheckBox1: TDBCheckBox;
    DBDateEdit1: TCMDateTimePicker;
    DBDateEdit2: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    Label4: TLabel;
    wwDBEdit1: TwwDBEdit;
    DBCheckBox2: TDBCheckBox;
    Label5: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    procedure PreencheRegra;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnProcDetClick(Sender: TObject);
    procedure sbtnApagDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryServCmbBeforeOpen(DataSet: TDataSet);
    procedure qryTpServAssBeforeOpen(DataSet: TDataSet);
    procedure qryPrincAfterScroll(DataSet: TDataSet);
    procedure qryContribAssAfterInsert(DataSet: TDataSet);
    procedure qryContribAssAfterPost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TrataIntegracao;
    procedure FormActivate(Sender: TObject);
    procedure VoltaGrid;
    procedure qryPrincAfterInsert(DataSet: TDataSet);
    procedure bbtnSairClick(Sender: TObject);
    procedure DeletaProvento;
    Procedure InsereProvento;
    procedure dsDetStateChange(Sender: TObject);
    procedure InsereContrib(sIdplanass: String);
    procedure deletaServContribAss;
    procedure btnConsClick(Sender: TObject);
    procedure spbLimpa1Click(Sender: TObject);
    procedure spbLimpa2Click(Sender: TObject);
    procedure spbLimpa3Click(Sender: TObject);
    procedure spbLimpa4Click(Sender: TObject);
    procedure spbLimpa5Click(Sender: TObject);
    procedure spbLimpa6Click(Sender: TObject);
    procedure spbLimpa7Click(Sender: TObject);
    procedure cmbTipoRegraContribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra7CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra3CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure btnGerarRubricasClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    marcado, marcadoi: boolean;
  end;

var
  frmPlanAss: TfrmPlanAss;
  pag, comiss, reemb: integer;
  Consulta, inseriuCont: boolean;
  idServAss, nome, nomePlano, idProvento, idProventoN, idProventoA, idProventoD,
  Descricao, Tipo, prioridade, idCont: string;
  mens: TModalResult;

implementation

uses
  UDataBase, UMensErro, UAutorizacao, FPrecoServPlan, FTelaAut, USistema,
  UAdmAss, FCadServContribass, UModulo, UIntegraBack;

{$R *.DFM}

procedure TfrmPlanAss.DeletaServContribAss;
begin
  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('DELETE SERVCONTRIBASS  '+
      'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+') '+
        'AND (IDCONTASS = '+inttostr(iidcontrib)+') ');
  try
    qryAux.Execsql;
  except
    raise;
  end;
end;

procedure TfrmPlanAss.DeletaProvento;
begin
  (* Tenta deletar deletar em provdesc *)
  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('DELETE PROVDESC'+
     ' WHERE (IDPROVENTO IN ('+idproventon+','+idproventoa+','+idproventod+'))');
  try
    qryAux.Execsql;
  except
  end;

  (* Tenta deletar em rubricaxpess *)
  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('DELETE RUBRICAXPESS'+
                 ' WHERE (IDRUBRICA IN ('+idproventon+','+idproventoa+','+idproventod+'))');
  try
    qryAux.Execsql;
  except
  end;
end;

procedure TfrmPlanAss.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
  var  varFields: Variant;
begin
  if qryContribAss.State in [dsinsert, dsedit] then
  begin
    varFields := VarArrayCreate([0,2],varVariant);
    varFields[0] := qryContribAss.FieldByName('IDPLANASS').AsInteger;
    varFields[1] := qryContribAss.FieldByName('IDCONTASS').AsInteger;
    qryContribAss.Post;
    qryContribAss.Close;
    qryContribAss.Open;
    qryContribAss.Locate('IDPLANASS;IDCONTASS',varFields,[loCaseInsensitive,loPartialKey]);
    Accept := true;
  end;
  inherited;
end;

procedure TfrmPlanAss.CmeCadastroConfirma(Sender: TObject);
Var id: Integer;
begin
  id:= qryprinc.FieldByName('IDPLANASS').asInteger;
  if qryPrinc.State in [dsinsert, dsedit] then
  With qryPrinc do
  begin
    Post;
    Close;
    Open;
    Locate('IDPLANASS',id,[loCaseInsensitive,loPartialKey]);
  end; {With}
  inherited;
end;

procedure TfrmPlanAss.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  try
    qryPrinc.close;
    qryPrinc.sql.clear;
    qryPrinc.sql.add
      ('SELECT IDPLANASS,IDPESSOA,IDREGRAATRASOJUR,IDFORNSERV,CODPORTFORMA,'+
              'CODTIPODOCHISTPAG,IDPRODASS,RECPAGHISTPAG,NOME,CODTIPORECHISTREC,'+
              'IDREGRAADMINISTR,RECPAGHISTREC,FLGFECHADO,IDREGRACOBRANCA,'+
              'IDREGRAGERAL,IDREGRAADMISSAO,IDREGRAPAGAMENTO,IDREGRABENEFICIA,'+
              'IDREGRACANCELAME,IDREGRADESISTENC,IDREGRACOMISSAO,NUMCONTRATO,'+
              'DATAINICIOVIGENC,DATAINICIOCOM,CODTIPRECHISTPAG,CODTIPODOCHISTREC,'+
              'IDREGRAATRASOCOR,IDREGRADEVOLJUROS,IDREGRADEVOLCORR,'+
              'FLGATIVO,OPCAOAIDENT,OPCAOBDIF '+
         'FROM '+sistema.PrefixoServidor+'PLANASS');
    qryPrinc.open;
    qryTipoRegra.open;

    qryTipoRegra1.open;
    qryTipoRegra2.open;
    qryTipoRegra3.open;
    qryTipoRegra7.open;

    PreencheRegra;

    qryContrib.open;
    qryPortForm.open;
    qryProvento.open;
    qryProdAss.open;
    qryFornServAss.open;
    cmbRegraContrib.text := '';
  except
    raise;
  end;
  pgctrlDetalhe.ActivePage := tbshDetalhe;
  inherited;
end;

(* Insere em CONTRIBPLANPREVA as contribuições inseridas após a associação de planos *)
procedure TfrmPlanAss.InsereContrib(sIdPlanAss: string);
begin
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add
    ('SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPLANASS, PP.CODCENTROCUSTOC, '+
           ' PP.CODALTERADORJUROS, PP.CODCENTRORESPON, PP.IDPESSOA, PP.TIPCODIGO,'+
           ' PP.UNIDNEGOC, PP.CODSUBCONTA, PP.PLACONTAD, PP.PLANO, PP.PLACONTAC,'+
           ' PP.FLGATIVO, PP.CODCENTROCUSTOD, PP.FLGAUTONUMINSC, PP.NUMINSCINICIAL,'+
           ' PP.IDEMPRESA, PP.CODALTERADORCORR, CT.IDCONTASS '+
      ' FROM PLANPREVASS PP, CONTRIBASS CT '+
     ' WHERE (PP.IDPLANASS = '+sIdPlanAss+')'+
       ' AND (PP.IDPLANASS = CT.IDPLANASS)'+
       ' AND (CT.IDCONTASS NOT IN (SELECT CPA.IDCONTASS'+
                                   ' FROM CONTRIBPLANPREVA CPA'+
                                  ' WHERE (CPA.IDPLANASS = '+sIdPlanAss+'))) ');
  qryAux.open;
  qryAux.first;

  if not qryAux.isEmpty then
  begin
     while not qryAux.eof do
     begin
        qryAux2.close;
        qryAux2.sql.clear;
        qryAux2.sql.add
          ('INSERT INTO CONTRIBPLANPREVA(IDPLANASS,IDCONTASS,IDPESSJUR, '+
                 ' IDPLANOPREV,CODCENTROCUSTOC,CODCENTROCUSTOD,PLANO,PLACONTAD, '+
                 ' PLACONTAC,IDEMPRESA ,IDPESSOA, CODCENTRORESPON,CODSUBCONTA, '+
                 ' CODALTERADORJUROS, CODALTERADORCORR, TIPCODIGO, UNIDNEGOC) '+
          ' VALUES ('+qryAux.FieldByName('IDPLANASS').AsString+','+
                    ''+qryAux.FieldByName('IDCONTASS').AsString+','+
                    ''+qryAux.FieldByName('IDPESSJUR').AsString+','+
                    ''+qryAux.FieldByName('IDPLANOPREV').AsString+','+
                    ' :CODCENTROCUSTOC,'+
                    ' :CODCENTROCUSTOD,'+
                    ' :PLANO,'+
                    ' :PLACONTAD,'+
                    ' :PLACONTAC,'+
                    ' :IDEMPRESA,'+
                    ' :IDPESSOA,'+
                    ' :CODCENTRORESPON,'+
                    ' :CODSUBCONTA,'+
                    ' :CODALTERADORJUROS,'+
                    ' :CODALTERADORCORR,'+
                    ' :TIPCODIGO,'+
                    ' :UNIDNEGOC)');
        try
           qryAux2.ParamByName('CODCENTROCUSTOC').AsString := '';
           qryAux2.ParamByName('CODCENTROCUSTOD').AsString :=  '';
           qryAux2.ParamByName('PLANO').AsString := '';
           qryAux2.ParamByName('PLACONTAD').AsString := '';
           qryAux2.ParamByName('PLACONTAC').AsString := '';
           qryAux2.ParamByName('IDEMPRESA').AsString := '';
           qryAux2.ParamByName('IDPESSOA').AsString  := '';
           qryAux2.ParamByName('CODCENTRORESPON').AsString := '';
           qryAux2.ParamByName('CODSUBCONTA').AsString := '';
           qryAux2.ParamByName('CODALTERADORJUROS').AsString := '';
           qryAux2.ParamByName('CODALTERADORCORR').AsString := '';
           qryAux2.ParamByName('TIPCODIGO').AsString  := '';
           qryAux2.ParamByName('UNIDNEGOC').AsString  := '';

           qryAux2.execsql;
        except
          raise;
        end;
        qryAux.next;
     end;
  end;
end;

procedure TfrmPlanAss.bbtnConfirmarClick(Sender: TObject);
var idPlanAss: string;

{sub} (* Verifica se campos estão preenchidos *)
Function ExisteErro: Boolean;
Var cCh: Char;
begin
  cCh:=#0;
  If DBEdit1.text = '' then cCh:='1'
  {} {INIBIDO ATÉ QUE SEJA INCLUIDO NO SISTEMA O CADASTRO DE FORNECEDORES}
  {else If wwDBLookupCombo1.text = '' then cCh:='2'}
  else If wwDBLookupCombo2.text = '' then cCh:='3';
  Case cCh of
    '1' : MsgDlg('É preciso digitar o nome do plano!','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('É preciso selecionar o fornecedor!','Erro',mtError,[mbOk,mbHelp],0);
    '3' : MsgDlg('É preciso selecionar o produto !','Erro',mtError,[mbOk,mbHelp],0);
  end;
  ExisteErro:=cCh<>#0;
end;

begin
  (* Verifica se os campos estão preenchidos *)
  If ExisteErro then Exit;

  idPlanAss := qryPrinc.FieldByName('IDPLANASS').AsString;

  inherited;

  qryTpServAss.CommitUpdates;
  dbgrdDet.applySelected;
  tbRegra.enabled := true;
  tbshDetalhe.enabled := true;

  (* Insere proventos *)
  if inseriuCont then InsereProvento;

  inseriuCont := false;
  ListAux.Items.clear;

  (* Insere Contribuição *)
  InsereContrib(idPlanAss);

  qryPrinc.close;
  qryPrinc.open;
end;

procedure TfrmPlanAss.InsereProvento;
var ind, j, idposicao: integer;
    sAux: string;
    IncProvDesc: Boolean;
    cFlgDesconto, cFlgAtrasoDevol: char;
begin
  cFlgDesconto:=High(cFlgDesconto);
  ListAux.Itemindex:= 0;
  cFlgAtrasoDevol:=#0;
  For ind:=0 to ListAux.Items.Count-1 do
  begin
    ListAux.ItemIndex:= ind;

    idPosicao := pos(';', ListAux.Items[ind]);
    Descricao := Copy(ListAux.Items[ind], 1, idPosicao-1);
    sAux := Copy(ListAux.Items[ind], idPosicao+1, length(ListAux.Items[ind]));

    idPosicao := pos(';', sAux);
    idProventoN := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    idProventoA := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    idProventoD := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    Prioridade := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    if idPosicao <> 0 then
    begin
      IdCont := Copy(sAux, 1, idPosicao-1);
      sAux := Copy(sAux, idPosicao+1, length(sAux));
    end
    else
    begin
      Idcont := sAux;
    end;

    For j:=1 to 3 do
    begin
       case j of
         1: begin
              Tipo := 'Normal';
              idProvento := idProventoN;
              cFlgAtrasoDevol := 'N';
              cFlgDesconto := '1';
            end;
         2: begin
              Tipo := 'Atraso';
              idProvento := idProventoA;
              cFlgAtrasoDevol := 'A';
              cFlgDesconto := '1';
            end;
         3: begin
              Tipo := 'Devolucao';
              idProvento := idProventoD;
              cFlgAtrasoDevol := 'D';
              cFlgDesconto := '0';
            end;
       end;

       (* Insere em provdesc *)
       sAux := descricao+'-['+Tipo+']';
       qryAux.close;
       qryAux.sql.clear;
       qryAux.SQL.add
         ('SELECT COUNT(*) TOT FROM PROVDESC'+
          ' WHERE (DESCRICAO = '''+sAux+''')');
       IncProvDesc:=False;
       try
          qryAux.open;
          if qryAux.FieldByName('TOT').asInteger > 0 then
          begin
            ShowMessage('ATENÇÃO: a rubrica "'+sAux+'" já está cadastrada.');
          end else IncProvDesc:=True;
       except
         exit;
       end;

       If IncProvDesc then
       begin
         qryAux.close;
         qryAux.sql.clear;
         qryAux.SQL.add
           ('INSERT INTO PROVDESC(IDPROVENTO,FLGDESCONTO,DESCRICAO,FLGIRRF,'+
                  ' FLGFGTS, FLGINSS,FLGINTERNO,FLGCONSOLIDA,FLGCONSTAFOLHA,'+
                  ' FLGOBRIGAFAVOREC,FLGRAIS, FLGSALFAMILIA,FLGDECIMOTERCEIRO,'+
                  ' FLGFERIAS,FLGRESCISAO,FLGUSO,FLGTPRUBRICA,FLGATRASODEVOL,NUMPRIORIDADE,'+
                  ' IDMODULO)'+
           ' VALUES ('+idProvento+','+cFlgDesconto+','''+sAux+''','+
                     '0,0,0,1,0,0,0,0,0,0,0,0,''A'',''A'','''+cFlgAtrasoDevol+''','+
                     prioridade+','+intToStr(Sistema.IdModulo)+')');
         try
            qryAux.ExecSQL;
         except
           raise;
         end;
       end;
    end; {For}

    (* Insere em contribass *)
    qryAux.close;
    qryAux.sql.clear;
    qryAux.SQL.add
      ('UPDATE CONTRIBASS'+
         ' SET IDPROVENTO='+idProventoN+','+
             ' IDPROVENTOATRASO = '+idProventoA+','+
             ' IDPROVENTODEVOL='+idProventoD+
       ' WHERE (IDCONTASS = '+idCont+')'+
         ' AND (IDPLANASS = '+qryPrinc.FieldByName('IDPLANASS').AsString+')');
    try
       qryAux.ExecSQL;
    except
      raise;
    end;
  end; {For principal}
  qryProvento.close;
  qryProvento.open;
end;

procedure TfrmPlanAss.VoltaGrid;
begin
   qrycontribass.close;
   qrycontribass.SQL.clear;
   qrycontribass.sql.add
     ('SELECT C.IDPLANASS,C.IDCONTASS,C.IDREGRA,C.IDEMPRESA,C.IDPROVENTO,'+
             'C.IDPESSOA,C.CODPORTFORMA,C.IDTPPERIODICIDADE,C.PAGADOR,C.TEMPOCOBR,'+
             'C.IDPROVENTOATRASO,C.IDPROVENTODEVOL,C.PRIORIDADE,'+
             'C.FLGCOBEVENTO,REGRA.NOMEREGRA,TP.NOME NOMETP,PT.DESCRICAO,CT.NOME,'+
             'C.FLGCOBCARNE '+
       ' FROM CONTRIBASS C,REGRA,TPPERIODICIDADE TP,PORTADORFORMA PT,CONTRIBUICAO CT'+
      ' WHERE (C.IDPLANASS = :IDPLANASS)'+
        ' AND (C.IDREGRA = REGRA.IDREGRA)'+
        ' AND (TP.IDTPPERIODICIDADE = C.IDTPPERIODICIDADE)'+
        ' AND (PT.CODPORTFORMA(+) = C.CODPORTFORMA)'+
        ' AND (CT.IDCONTRIBUICAO = C.IDCONTASS)');
   qrycontribass.requestlive := false;
   with dbgrdDet  do
   begin
     Selected.Clear;
     Selected.Add('NOME'       +#9+'25'+#9+'Contribuição');
     Selected.Add('FLGCOBCARNE'+#9+'10'+#9+'Carnê?');
     Selected.Add('NOMETP'     +#9+'25'+#9+'Forma de Pagamento');
     Selected.Add('PAGADOR'    +#9+'15'+#9+'Pagador');
     Selected.Add('DESCRICAO'  +#9+'25'+#9+'Rubrica');
     Selected.Add('PRIORIDADE' +#9+'10'+#9+'Prioridade');
     Selected.Add('NOMEREGRA'  +#9+'25'+#9+'Regra');
   end;
   qrycontribass.open;
   dbgrdDet.applyselected;
   dbgrdDet.BringToFront;
end;

procedure TfrmPlanAss.bbtnOkDetClick(Sender: TObject);
Var estado: TDatasetState;
    idContAss, j: integer;

{sub} (* Verifica se campos estão preenchidos *)
Function ExisteErro: Boolean;
Var cCh: Char;
begin
  cCh:=#0;
  If cmbcontrib.text = '' then cCh:='1'
  else If cmbRegraContrib.Text = '' then cCh:='2'
  else If spinPri.Text = '' then cCh:='3'
  else If RgpSel.itemIndex = -1 then cCh:='4'
  else If cmbFormaPag.text = '' then cCh:='5';
  Case cCh of
    '1' : MsgDlg('É preciso selecionar o tipo de contribuição !','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('É preciso associar uma regra a esta contribuição !','Erro',mtError,[mbOk,mbHelp],0);
    '3' : MsgDlg('É preciso selecionar uma prioridade!','Erro',mtError,[mbOk,mbHelp],0);
    '4' : MsgDlg('É preciso selecionar o responsável pelo pagamento!','Erro',mtError,[mbOk,mbHelp],0);
    '5' : MsgDlg('É preciso selecionar o local pagamento padrão da contribuição!','Erro',mtError,[mbOk,mbHelp],0);
  end;
  Case cCh Of
    '1' : cmbContrib.setFocus;
    '2' : cmbRegraContrib.setFocus;
    '3' : spinPri.setFocus;
    '4' : RgpSel.setFocus;
    '5' : cmbFormaPag.setFocus;
  end;
  ExisteErro:=cCh<>#0;
end;

begin
   idcontass := qrycontribass.FieldByName('IDCONTASS').asInteger;

   (* Verifica se os campos estão preenchidos *)
   If ExisteErro then Exit;

   if dsdet.dataset.state in [dsinsert] then
   begin
      inseriuCont := true;
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add
        ('SELECT IDCONTASS'+
          ' FROM CONTRIBASS'+
         ' WHERE (IDCONTASS = '+qrycontrib.FieldByName('IDCONTRIBUICAO').AsString+')'+
           ' AND (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+')');
      qryAux.open;

      if not qryAux.isEmpty then
      begin
         showMessage('Este tipo de contribuição já foi associado ao plano em questão !');
         cmbContrib.setFocus;
         exit;
      end;
   end;

   If dsDet.dataset.state = dsInsert then
   begin
     qryContribAss.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   end;

   If (dsDet.dataset.state = dsInsert) or (dsDet.dataset.state = dsEdit) then
   begin
     case rgpSel.itemIndex of
       0: qryContribAss.FieldByName('PAGADOR').AsString := 'P';
       1: qryContribAss.FieldByName('PAGADOR').AsString := 'C';
     end;
     case rgFlgCobCarne.itemIndex of
       0: qryContribAss.FieldByName('FLGCOBCARNE').AsInteger := 0;
       1: qryContribAss.FieldByName('FLGCOBCARNE').AsInteger := 1;
     end;
   end;

   estado := dsDet.dataset.state;

   if (qryContribAss.FieldByName('PAGADOR').AsString = 'C') then
   begin
     for j:=1 to 3 do
     begin
       qryAux.close;
       qryAux.sql.clear;
       idProvento := intToStr(LeUltRegistro(qryAux,'PROVDESC'));
       case j of
         1: idProventoN := idProvento;
         2: idProventoA := idProvento;
         3: idProventoD := idProvento;
       end;
     end;
     Descricao := qryContrib.FieldByName('NOME').AsString+'-'+qryPrinc.FieldByName('NOME').AsString+'';
     ListAux.items.Add(''+Descricao+';'+idProventoN+';'+idProventoA+';'+idProventoD+';'+
                        trim(spinPri.Text)+';'+intToStr(idContAss)+'');
   end; {If}

   marcadoi := DBCkboxEvento.checked;
   iIdContrib := qryContribAss.FieldByName('IDCONTASS').AsInteger;

   inherited;

   (* Verifica se houve mudança na marcação do flgcobevento *)
   if (marcadoi <> marcado) and (estado in [dsedit,dsinsert]) and (marcadoi) then
   begin
      AbrirFormModal(frmCadSevContribAss, TfrmCadSevContribAss);
      if not frmCadSevContribAss.selecionou then
      begin
         qryAux.Close;
         qryAux.sql.clear;
         qryAux.sql.add('DELETE SERVCONTRIBASS'+
                        ' WHERE (IDPLANASS = '+qryPrinc.FieldByName('IDPLANASS').AsString+')' +
                          ' AND (IDCONTASS = '+intToStr(iIdContrib)+')');
         try
            qryAux.execSQL;
         except
           raise;
         end;

         qryAux.Close;
         qryAux.sql.clear;
         qryAux.sql.add('DELETE CONTRIBASS'+
                        ' WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+')' +
                          ' AND (IDCONTASS = '+inttostr(iidcontrib)+')');
         try
            qryAux.execsql;
         except
           raise;
         end;
      end;
   end;

   If (estado = dsEdit) and (not marcadoi) and (marcadoi <> marcado) then
   begin
     DeletaServContribAss;
   end;

   If estado = dsEdit then VoltaGrid;

   dbgrdDet.applySelected;

   tbRegra.enabled := true;
   rgpSel.enabled := true;
   rgpSel.visible := true;
   rgpSel.itemIndex := 1;
end;

procedure TfrmPlanAss.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.applyselected;
  tbRegra.enabled := true;
  VoltaGrid;
end;

procedure TfrmPlanAss.sbtnInsDetClick(Sender: TObject);
begin
  if (DBEdit1.text = '')Or(wwDBLookupCombo1.text = '')Or
      (wwDBLookupCombo2.text = '') then Exit;

   btnGerarRubricas.visible := false;
   btncons.enabled := false;
   DBCkboxevento.enabled := false;
   DBCkboxevento.checked := false;
   Rgpsel.Enabled := true;
   Rgpsel.Visible := true;
   Rgpsel.itemindex := 1;
   cmbcontrib.enabled := true;
   cmbTipoRegraContrib.text := '';
   cmbRegraContrib.text := '';
   cmbRegraContrib.enabled := true;
   DBEdit2.enabled := true;

   if (qryprinc.state = dsinsert) then
   begin
     qryaux.close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('INSERT INTO PLANASS(IDPLANASS)'+
                    'VALUES ('+qryprinc.FieldByName('IDPLANASS').AsString+')');
     try
       qryaux.execsql;
     except
       raise;
     end;
   end;
   
   with qrycontribass do
   begin
     close;
     SQL.clear;
     sql.add
       ('SELECT IDPLANASS,IDCONTASS,IDREGRA,IDEMPRESA,IDPROVENTO,IDPESSOA,CODPORTFORMA,'+
               'IDTPPERIODICIDADE,PAGADOR,TEMPOCOBR,IDPROVENTOATRASO,IDPROVENTODEVOL,'+
               'PRIORIDADE,FLGCOBEVENTO, FLGCOBCARNE '+
         ' FROM '+sistema.PrefixoServidor+'CONTRIBASS'+
        ' WHERE (IDPLANASS = :IDPLANASS)');
     requestlive := true;
     open;
   end; {With}

   with qryRegra do
   begin
     close;
     paramByName('IDTIPOREGRA').asinteger := -1;
     open;
   end; {With}

   inherited;

   pgctrlDetalhe.activepage := tbshDetalhe;
   tbRegra.enabled := false;
   cmbContrib.SetFocus;
end;

procedure TfrmPlanAss.sbtnAltDetClick(Sender: TObject);
var idContAss, idTipoRegra: integer;
begin
  If qryContribAss.isempty then
  begin
     sbtnAltDet.down := false;
     exit;
  end;

  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.Add
    ('SELECT IDSERVASS'+
      ' FROM SERVCONTRIBASS '+
     ' WHERE (IDPLANASS = '+qryPrinc.FieldByName('IDPLANASS').AsString+') '+
       ' AND (IDCONTASS = '+qryContribAss.FieldByName('IDCONTASS').AsString+')');
  qryaux.open;
  if qryAux.IsEmpty then
    btnCons.enabled := false
  else
    btnCons.enabled := true;

  if qryContribAss.FieldByName('FLGCOBEVENTO').AsInteger = 0 then
    btnCons.enabled := false;

  if qryTpServAss.isEmpty then
  begin
     DBCkboxEvento.enabled := false;
     DBCkboxEvento.checked := false;
  end;

  if qryContribAss.isempty then
  begin
    sbtnAltDet.down := false;
    exit;
  end;

  rgpSel.Enabled := false;
  cmbContrib.enabled := false;
  DBEdit2.enabled := false;

  Case qryContribAss.FieldByName('FLGCOBCARNE').AsInteger of
    0: rgFlgCobCarne.itemindex := 0;
    1: rgFlgCobCarne.itemindex := 1;
  end;

  if (qryContribAss.FieldByName('PAGADOR').AsString = 'P') then rgpSel.Visible := true;

  idContAss := qryContribAss.FieldByName('IDCONTASS').AsInteger;

  pgctrlDetalhe.ActivePage := tbshDetalhe;

  With qryContribAss do
  begin
    close;
    SQL.clear;
    sql.add
      ('SELECT IDPLANASS,IDCONTASS,IDREGRA,IDEMPRESA,IDPROVENTO,IDPESSOA,CODPORTFORMA,'+
              'IDTPPERIODICIDADE,PAGADOR,TEMPOCOBR,IDPROVENTOATRASO,IDPROVENTODEVOL,'+
              'PRIORIDADE,FLGCOBEVENTO, FLGCOBCARNE '+
        ' FROM '+sistema.PrefixoServidor+'CONTRIBASS'+
       ' WHERE (IDPLANASS = :IDPLANASS)');
    requestlive := true;
    open;

    Locate('IDCONTASS',idContAss,[loCaseInsensitive,loPartialKey]);

    if FieldByName('PAGADOR').AsString = 'C' then
    begin
      rgpSel.itemindex := 1;
      btnGerarRubricas.visible := (FieldByName('IDPROVENTO').AsString = '')
                               or (cmbRubNormal.text = '');
    end
    else
    begin
      rgpSel.itemindex := 0;
      btnGerarRubricas.visible := false;
    end;
  end; {With}

  with qryTipoRegraAux do
  begin
    Close;
    ParamByName('IDREGRA').asInteger :=qryContribAss.FieldByName('IDREGRA').AsInteger;
    open;
    idTipoRegra := FieldByName('IDTIPOREGRA').asInteger;
  end; {With}

  with qryRegra do
  begin
    close;
    paramByName('IDTIPOREGRA').asInteger := idTipoRegra;
    open;
  end; {With}
  cmbTipoRegraContrib.LookupValue := intToStr(idTipoRegra);
  cmbRegraContrib.enabled := true;
  inherited;
  pgctrlDetalhe.activepage := tbshDetalhe;
end;

procedure TfrmPlanAss.sbtnProcDetClick(Sender: TObject);
begin
  inherited;
  showmessage('Procura ainda não implementada!');
  sbtnProcDet.down := false;
end;

procedure TfrmPlanAss.sbtnApagDetClick(Sender: TObject);
Var idcontass: String;
begin
  if qrycontribass.isempty then
  begin
     sbtnApagDet.down := false;
     exit;
  end;
  idcontass:= qrycontribass.FieldByName('IDCONTASS').AsString;

  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
     ('SELECT IDPLANASS,IDCONTASS,IDREGRA,IDPROVENTO,IDPESSOA,CODPORTFORMA,'+
             'IDTPPERIODICIDADE,PAGADOR,TEMPOCOBR,IDPROVENTOATRASO,'+
             'IDPROVENTODEVOL,PRIORIDADE,FLGCOBEVENTO,IDEMPRESA'+
       ' FROM CONTRIBASS'+
      ' WHERE (IDPLANASS ='+qryprinc.FieldByName('idplanass').AsString+')'+
        ' AND (IDCONTASS ='+idcontass+')');
  try
     qryAux.open;
  except
     raise;
  end;

  idproventon := qryAux.FieldByName('IDPROVENTO').AsString;
  idproventoa := qryAux.FieldByName('IDPROVENTOATRASO').AsString;
  idproventod := qryAux.FieldByName('IDPROVENTODEVOL').AsString;

  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDCONTASS'+
                 ' FROM CONTASS'+
                 ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')'+
                 ' AND (IDCONTASS ='+qrycontribass.FieldByName('IDCONTASS').AsString+')');
  try
     qryAux.open;
  except
     raise;
  end;

  If not  qryAux.isempty then
  begin
    showmessage('A contribuição não pode ser apagada, por ter contribuintes relacionados a ela !');
    sbtnApagDet.down := false;
    exit;
  end;
  // inherited;

   sbtnApagDet.Down := True;

   if dsDet.DataSet.isempty then
   begin
     sbtnApagDet.Down := False;
     Exit;
   end;

   try
     if MsgDlg('Deseja realmente apagar a Contribuição?','Confirmação',
                 mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     begin
       qryaux.close;
       qryaux.SQL.clear;
       qryaux.sql.add('DELETE CONTRIBPLANPREVA '+
                       'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+
                       ') AND (IDCONTASS = '+idcontass+')');
       qryaux.execsql;

       qryaux.close;
       qryaux.SQL.clear;
       qryaux.sql.add('DELETE CONTRIBASS '+
                       'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+
                       ') AND (IDCONTASS = '+idcontass+')');
       qryaux.execsql;

       deletaServContribAss;

       DeletaProvento;

       VoltaGrid;
       pgctrlDetalhe.activepage := tbshDetalhe;
     end;
   except
     raise;
   end;
   sbtnApagDet.Down := false;
end;

procedure TfrmPlanAss.sbtnApagarClick(Sender: TObject);
begin
   qryaux.close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add
     ('SELECT IDPLANASS '+
       ' FROM PLANASS'+
      ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')'+
        ' AND (IDPLANASS IN (SELECT IDPLANASS '+
                              'FROM PLANPREVASS'+
                            ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANASS'+
                             ' FROM CONTRIBASS '+
                             'WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANASS'+
                             ' FROM SERVPLANASS'+
                            ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANOASSIST'+
                          ' FROM HISTPATR'+
                         ' WHERE (IDPLANOASSIST='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANASS'+
                             ' FROM PARTASS'+
                            ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))');
   try
     qryAux.open;
   except
     raise;
   end;
   if not qryAux.isempty then
   begin
     Showmessage('O plano não pode ser apagado por estar relacionado com um plano previdenciário e / ou uma contribuição e /ou serviços !!!');
     sbtnApagar.down := false;
     exit;
   end;

   sbtnApagar.Down := True;

   If ds.DataSet.isempty then
   begin
	  sbtnApagar.Down := False;
     Exit;
   end;

   try
      if MsgDlg('Deseja realmente apagar o Plano Assistencial?','Confirmação',mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
      begin
        qryaux.close;
        qryaux.sql.clear;
        qryaux.sql.add
          ('DELETE PLANASS'+
           ' WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+')');
        qryaux.execsql;

        qryprinc.Close;
        qryprinc.open;
      end;
   finally
      sbtnApagar.Down := false;
   end;
   dbgrdDet.applyselected;
end;

procedure TfrmPlanAss.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  {   if (DBEdit1.text = '')
        or (wwDBLookupCombo1.text = '')
        or (wwDBLookupCombo2.text = '') then
     begin
        Accept := false;
        showmessage('Dados incompletos !');
        VoltaGrid;
        exit;
     end
     else}  {} {INIBIDO ATÉ QUE SEJA INCLUIDO NO SISTEMA O CADASTRO DE FORNECEDORES}
     begin
       Accept := true;
     end;
end;

procedure TfrmPlanAss.qryServCmbBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryprinc.active then
  begin
    qryservcmb.ParamByName('IDPLANASS').AsInteger := qryprinc.FieldByName('IDPLANASS').AsInteger;
  end;
end;

procedure TfrmPlanAss.qryTpServAssBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryprinc.active then
  begin
     qrytpservass.ParamByName('IDPLANASS').AsInteger := qryprinc.FieldByName('IDPLANASS').AsInteger;
  end;
end;

procedure TfrmPlanAss.qryPrincAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryprinc.active then
  begin
    qryservcmb.close;
    qrytpservass.close;
    qrytpservass.open;
    qryservcmb.open;

    VoltaGrid;

  end; {If}
end;

procedure TfrmPlanAss.qryContribAssAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qrycontribass.FieldByName('IDPLANASS').AsInteger := qryprinc.FieldByName('IDPLANASS').AsInteger ;
end;

procedure TfrmPlanAss.qryContribAssAfterPost(DataSet: TDataSet);
begin
  inherited;
  if dsdet.dataset.state = dsedit then
  begin
    VoltaGrid;
  end;
end;

procedure TfrmPlanAss.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   listaux.Items.Clear;

   inseriuCont := false;

   qryprinc.close;
   qryprinc.open;

   if (qryprinc.state = dsinsert) then
   begin
      (* APAGA CONTRIBUIÇÕES *)
      qryaux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE CONTRIBASS'+
                     ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')');
      try
         qryaux.execsql;
      except
        raise;
      end;

      (* APAGA SERVIÇOS *)
      qryaux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE PLANASS'+
                     ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')');
      try
         qryaux.execsql;
      except
        raise;
      end;

      (* APAGA PLANO *)
      qryaux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE PLANASS'+
                     ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')');
      try
         qryaux.execsql;
      except
        raise;
      end;
   end;
   tbRegra.enabled := true;
   ListAux.Items.clear;
   PreencheRegra;
end;

procedure TfrmPlanAss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryPrinc.Close;
  qryRegra.Close;
  qryContrib.Close;
  qryPortForm.Close;
  qryProvento.Close;
  qryProdAss.Close;
  qryFornServAss.Close;
end;

procedure TfrmPlanAss.TrataIntegracao;
begin
  try
    inherited;
    qryTipoDocCAR.Open;
    qryTipoDocCAP.Open;
    qryUsistema.sql.text := 'SELECT INTEGRACONTAB,MASCARADESEMB'+
                             ' FROM PARAMCAP'+
                            ' WHERE (PARAMCAP.RECPAG=''P'')'+
                              ' AND (PARAMCAP.IDPESSOA='+inttostr(Sistema.idEmpresa)+')';
    qryUsistema.open;
    if (not qryUSistema.EOF) then
    begin
      IntegraBack.Contabilidade := qryUsistema.FieldByName('INTEGRACONTAB').AsString ;
      IntegraBack.MascaraDesemb := qryUsistema.FieldByName('MASCARADESEMB').AsString;
    end
    else IntegraBack.Contabilidade := 'N';
    if IntegraBack.Contabilidade = 'S' then
    begin
      qryUsistema.sql.text := 'SELECT PARAMCONTAB.PLANO'+
                               ' FROM PLANO,PARAMCONTAB'+
                              ' WHERE (PARAMCONTAB.IDPESSOA='+IntToStr(Sistema.idEmpresa)+')'+
                                ' AND (PLANO.PLANO=PARAMCONTAB.PLANO)';
      qryUsistema.open;
      if (not qryUSistema.EOF) then
      begin
        IntegraBack.Plano := qryUsistema.FieldByName('PLANO').AsInteger;
      end
      else
      begin
        MsgDlg(LerMensagem(613),LerMensagem(2),mtError,[mbOK],0);
        close;
      end;
    end;
    qryUsistema.Close;
    try
      qryTpDesemb.ParamByName('IDPLANO').AsString := inttostr(IntegraBack.Plano);
      qryTpDesemb.ParamByName('IDEMPRESA').AsString := inttostr(Sistema.idEmpresa);
      qryTpDesemb.Open;
    except
      raise;
    end;
    qryUsistema.sql.text := 'SELECT INTEGRACONTAB,MASCARADESEMB'+
                             ' FROM PARAMCAP'+
                            ' WHERE (PARAMCAP.RECPAG=''R'')'+
                              ' AND (PARAMCAP.IDPESSOA='+inttostr(Sistema.idEmpresa)+')';
    qryUsistema.open;
    if (not qryUSistema.EOF) then
    begin
      IntegraBack.Contabilidade := qryUsistema.FieldByName('INTEGRACONTAB').AsString;
      IntegraBack.MascaraDesemb := qryUsistema.FieldByName('MASCARADESEMB').AsString;
    end
    else IntegraBack.Contabilidade := 'N';
    if IntegraBack.Contabilidade = 'S' then
    begin
      qryUsistema.sql.text := 'SELECT PARAMCONTAB.PLANO'+
                               ' FROM PLANO,PARAMCONTAB'+
                              ' WHERE (PARAMCONTAB.IDPESSOA='+IntToStr(Sistema.idEmpresa)+')'+
                                ' AND (PLANO.PLANO=PARAMCONTAB.PLANO)';
      qryUsistema.open;
      if (not qryUSistema.EOF) then
      begin
        IntegraBack.Plano := qryUsistema.FieldByName('PLANO').AsInteger;
      end
      else
      begin
        MsgDlg(LerMensagem(613),LerMensagem(2),mtError,[mbOK],0);
        Close;
      end;
    end;
    qryUsistema.Close;
    try
      qryTpReceb.ParamByName('IDPLANO').AsString := inttostr(IntegraBack.Plano);
      qryTpReceb.ParamByName('IDEMPRESA').AsString := inttostr(Sistema.idEmpresa);
      qryTpReceb.Open;
    except
      raise;
    end;

    qryTipoDocCAP.locate('CODTIPDOC',qryPrinc.FieldByName('CODTIPODOCHISTPAG').AsInteger,[loCaseInsensitive,loPartialKey]);
    qryTpDesemb.locate('CODTIPRECDES',qryPrinc.FieldByName('CODTIPRECHISTPAG').AsString,[loCaseInsensitive,loPartialKey]);

    qryTpReceb.locate('CODTIPRECDES',qryPrinc.FieldByName('CODTIPORECHISTREC').AsString,[loCaseInsensitive,loPartialKey]);
    qryTipoDocCAR.locate('CODTIPDOC',qryPrinc.FieldByName('CODTIPODOCHISTREC').AsInteger,[loCaseInsensitive,loPartialKey]);
  except
    raise;
  end;
end;

procedure TfrmPlanAss.FormActivate(Sender: TObject);
begin
  { TrataIntegracao; }
end;

procedure TfrmPlanAss.qryPrincAfterInsert(DataSet: TDataSet);
var id: integer;
begin
  inherited;
  id:=0;
  if (qryprinc.state = dsinsert) then  {++ TIRAR++}
    id := LeUltRegistro(qryler,'planass') ;
  qryprinc.FieldByName('IDPLANASS').AsInteger := id ;
end;

procedure TfrmPlanAss.bbtnSairClick(Sender: TObject);
begin
   if (qryprinc.state = dsinsert) then
   begin
      (* APAGA CONTRIBUIÇÕES *)
      qryaux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE CONTRIBASS '+
                     ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')');
      try
         qryaux.execsql;
      except
        raise;
      end;

      (* APAGA SERVIÇOS *)
      qryaux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE PLANASS '+
                     ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')');
      try
         qryaux.execsql;
      except
        raise;
      end;

      (* APAGA PLANO *)
      qryaux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE PLANASS '+
                     ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')');
      try
         qryaux.execsql;
      except
        raise;
      end;
   end;
   inherited;
end;

procedure TfrmPlanAss.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if dsdet.DataSet.state = dsinsert then
  begin
     qrycontribass.FieldByName('FLGCOBEVENTO').AsInteger := 0;
     DBCkboxevento.checked := false;
  end;

  if dsdet.dataset.state in [dsedit,dsinsert] then
  begin
     if qrycontribass.FieldByName('FLGCOBEVENTO').AsInteger = 0 then marcado := false
     else marcado := true;
  end;
end;

procedure TfrmPlanAss.btnConsClick(Sender: TObject);
begin
  inherited;
  if dsdet.dataset.state = dsedit then
  begin
     AbrirFormModal(frmCadSevContribass, TfrmCadSevContribass);
     if not frmcadsevcontribass.selecionou then
     begin
        DBCkboxevento.Checked := false;
        qrycontribass.FieldByName('FLGCOBEVENTO').AsInteger := 0;
     end;
  end;
end;

procedure TfrmPlanAss.spbLimpa1Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then
  begin
    cmbTipoRegra1.text := '';
    cmbRegra1.text := '';
    qryPrinc.FieldByname('IDREGRAADMISSAO').asString := '';
  end;
end;

procedure TfrmPlanAss.spbLimpa2Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then
  begin
    cmbTipoRegra2.text := '';
    cmbRegra2.text := '';
    qryPrinc.FieldByname('IDREGRABENEFICIA').asString := '';
  end;
end;

procedure TfrmPlanAss.spbLimpa3Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then
  begin
    cmbTipoRegra3.Text := '';
    cmbRegra3.Text := '';
    qryPrinc.FieldByname('IDREGRACANCELAME').asString := '';
  end;
end;

procedure TfrmPlanAss.spbLimpa4Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then cmbRegra4.Text := '';
end;

procedure TfrmPlanAss.spbLimpa5Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then cmbRegra5.Text := '';
end;

procedure TfrmPlanAss.spbLimpa6Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then cmbRegra6.Text := '';
end;

procedure TfrmPlanAss.spbLimpa7Click(Sender: TObject);
begin
  if qryPrinc.State in [dsinsert, dsedit] then
  begin
    cmbTipoRegra7.Text := '';
    cmbRegra7.Text := '';
    qryPrinc.FieldByname('IDREGRADESISTENC').asString := '';
  end;
end;

procedure TfrmPlanAss.cmbTipoRegraContribCloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegraContrib.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra1CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra1 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra1.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra1.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra7CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra7 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra7.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra7.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra2CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra2 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra2.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra2.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra3CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra3 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra3.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra3.enabled := true;
end;

procedure TfrmPlanAss.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  cmbTipoRegra1.text := '';
  cmbRegra1.text := '';
  cmbRegra1.enabled := true;

  cmbTipoRegra2.text := '';
  cmbRegra2.text := '';
  cmbRegra2.enabled := true;

  cmbTipoRegra3.text := '';
  cmbRegra3.text := '';
  cmbRegra3.enabled := true;

  cmbTipoRegra7.text := '';
  cmbRegra7.text := '';
  cmbRegra7.enabled := true;
end;

procedure TfrmPlanAss.PreencheRegra;
var idTipoRegra: integer;
begin
  if qryPrinc.FieldByName('IDREGRAADMISSAO').AsString = '' then
    cmbTipoRegra1.LookupValue := ''
  else
  begin
    with qryTipoRegraAux do
    begin
      Close;
      ParamByName('IDREGRA').asInteger := qryPrinc.FieldByName('IDREGRAADMISSAO').AsInteger;
      open;
      idTipoRegra := FieldByName('IDTIPOREGRA').asInteger;
    end; {with}

    with qryRegra1 do
    begin
      close;
      paramByName('IDTIPOREGRA').asInteger := idTipoRegra;
      open;
    end;
    cmbTipoRegra1.LookupValue := intToStr(idTipoRegra);
  end; {If}

  if qryPrinc.FieldByName('IDREGRABENEFICIA').AsString = '' then
    cmbTipoRegra2.LookupValue := ''
  else
  begin
    with qryTipoRegraAux do
    begin
      Close;
      ParamByName('IDREGRA').asInteger := qryPrinc.FieldByName('IDREGRABENEFICIA').AsInteger;
      open;
      idTipoRegra := FieldByName('IDTIPOREGRA').asInteger;
    end; {With}

    with qryRegra2 do
    begin
      close;
      paramByName('IDTIPOREGRA').asInteger := idTipoRegra;
      open;
    end;
    cmbTipoRegra2.LookupValue := intToStr(idTipoRegra);
  end; {else}

  if qryPrinc.FieldByName('IDREGRACANCELAME').AsString = '' then
    cmbTipoRegra3.LookupValue := ''
  else
  begin
    with qryTipoRegraAux do
    begin
      Close;
      ParamByName('IDREGRA').asInteger := qryPrinc.FieldByName('IDREGRACANCELAME').AsInteger;
      open;
      idTipoRegra := FieldByName('IDTIPOREGRA').asInteger;
    end; {With}

    with qryRegra3 do
    begin
      close;
      paramByName('IDTIPOREGRA').asInteger := idTipoRegra;
      open;
    end;
    cmbTipoRegra3.LookupValue := intToStr(idTipoRegra);
  end; {else}

  if qryPrinc.FieldByName('IDREGRADESISTENC').AsString = '' then
    cmbTipoRegra7.LookupValue := ''
  else
  begin
    with qryTipoRegraAux do
    begin
      Close;
      ParamByName('IDREGRA').asInteger := qryPrinc.FieldByName('IDREGRADESISTENC').AsInteger;
      open;
      idTipoRegra := FieldByName('IDTIPOREGRA').asInteger;
    end; {With}

    with qryRegra7 do
    begin
      close;
      paramByName('IDTIPOREGRA').asInteger := idTipoRegra;
      open;
    end;
    cmbTipoRegra7.LookupValue := intToStr(idTipoRegra);
  end; {else}
end;

procedure TfrmPlanAss.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  PreencheRegra;

  cmbRegra1.enabled := true;
  cmbRegra2.enabled := true;
  cmbRegra3.enabled := true;
  cmbRegra7.enabled := true;
end;

procedure TfrmPlanAss.sbtnProcurarClick(Sender: TObject);
begin
  { inherited; }
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
     qryPrinc.Close;
     qryPrinc.Open;
     qryPrinc.Locate('IDPLANASS',MontaSelect.ValoresChave[0],
                                [loCaseInsensitive, loPartialKey]);
  end;
  PreencheRegra;
end;

procedure TfrmPlanAss.btnGerarRubricasClick(Sender: TObject);
{ var idContAss, j: integer; }
begin
  if MsgDlg('Esta operação deve ser usada com critério, pois pode provocar dano ao sistema. Confirma a operação?',
     'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
  begin
    inseriuCont := true;
    qryContribAss.FieldByName('IDPROVENTO').asString := '';
    qryContribAss.FieldByName('IDPROVENTOATRASO').asString := '';
    qryContribAss.FieldByName('IDPROVENTODEVOL').asString := '';
    bbtnOkDet.Click;
    bbtnConfirmar.Click;
    (*
    ListAux.Items.clear;
    for j:=1 to 3 do
    begin
       qryAux.close;
       qryAux.sql.clear;
       idProvento := intToStr(LeUltRegistro(qryAux,'PROVDESC'));
       case j of
          1: idProventoN := idProvento;
          2: idProventoA := idProvento;
          3: idProventoD := idProvento;
       end;
    end;

    Descricao := qryContrib.FieldByName('NOME').AsString+'-'+qryPrinc.FieldByName('NOME').AsString+'';
    ListAux.items.Add(''+Descricao+';'+idProventoN+';'+idProventoA+';'+idProventoD+';'+
                      trim(spinPri.Text)+';'+intToStr(idContAss)+'');

    inseriuCont := true; //provoca criação das rubricas se pressionar OK
    *)
  end; {If}
end;

end.
