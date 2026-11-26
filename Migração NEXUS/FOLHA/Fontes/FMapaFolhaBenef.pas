{*******************************************************************************
******************************** REGISTRO DE ALTERAÇÕES ************************
********************************************************************************
------------------------------------------------------------------------------
Alteração  : Criação da Funcionalidade
Nº WO......: WO2511
Data.......: 14/05/2024
Responsável: Helen V Bianchi
Descrição..: Mapa da Folha de Beneficio
------------------------------------------------------------------------------}
unit FMapaFolhaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls, Spin,
  ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97,UFuncoesUteis,UMensErro,USistema;

type
  TfrmMapaFolhaBenef = class(TfrmOkCancelar)
    qryFolhaEfet: TwwQuery;
    qryFolhaEfetIDHSTFOLHABENEF: TFloatField;
    qryVerHistRubSal: TwwQuery;
    qryVerHistRubSalIDHSTFOLHABENEF: TFloatField;
    qryVerHistRubSalIDRUBRICA: TFloatField;
    qryVerHistRubSalCODPROVDESC: TStringField;
    qryVerHistRubSalDESCRICAO: TStringField;
    dsVerHistRubSal: TwwDataSource;
    Panel2: TPanel;
    bbtnVerificar: TBitBtn;
    grpPrevia: TGroupBox;
    Label2: TLabel;
    Bevel1: TBevel;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    dbgrdConsultaRubricas: TwwDBGrid;
    bbtnProcessa: TBitBtn;
    memResult: TMemo;
    Label17: TLabel;
    dblkpcmb: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbMesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnVerificarClick(Sender: TObject);
    procedure bbtnProcessaClick(Sender: TObject);
    procedure spedAnoExit(Sender: TObject);
    procedure dblkpcmbClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMesRef : String
  end;

var
  frmMapaFolhaBenef: TfrmMapaFolhaBenef;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmMapaFolhaBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree; 
end;

procedure TfrmMapaFolhaBenef.cmbMesChange(Sender: TObject);
begin
  inherited;
  sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
  bbtnProcessa.Enabled := False;
  memResult.Lines.Clear;
end;

procedure TfrmMapaFolhaBenef.FormCreate(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  bbtnProcessa.Enabled := False;
  cmbMes.ItemIndex := AMonth - 2;
  cmbMes.Text      := cmbMes.Items[cmbMes.ItemIndex];
  spedAno.Text     := IntToStr(AYear);
  
end;

procedure TfrmMapaFolhaBenef.bbtnVerificarClick(Sender: TObject);
begin
  inherited;
  memResult.Lines.Clear;
  if sMesRef <> '' then
  begin
     qryVerHistRubSal.close;
     qryVerHistRubSal.ParamByName('pMESCOBRANCA').AsString     :=  sMesRef;
     qryVerHistRubSal.ParamByName('pIDHSTFOLHABENEF').AsString :=  qryFolhaEfetIDHSTFOLHABENEF.AsString;
     qryVerHistRubSal.open;
     if qryVerHistRubSal.IsEmpty then
     begin
        bbtnProcessa.Enabled := True ;
        memResult.Lines.Add('Mapa da Folha de Beneficio autorizado para Processamento. ');
        memResult.Lines.Add('Todas as rubricas estão parametrizadas. ');
     end
     else
     begin
        bbtnProcessa.Enabled := False;
        memResult.Lines.Add('Foram encontradas Rubricas sem parametrizações. ');
        memResult.Lines.Add('Processamento não autorizado. ');
     end;

  end;
end;

procedure TfrmMapaFolhaBenef.bbtnProcessaClick(Sender: TObject);
var
  sMsgErro  : string;
  SP_PROC   : TStoredProc;
  bErro     : boolean;
begin
  inherited;
  try
    memResult.Lines.Add('--------------------------------------------------------------------');
    memResult.Lines.Add('Início do Processamento : ' + DateTimeToStr(Now));
    try
      SP_PROC := TStoredProc.Create(Self);
      SP_PROC.DatabaseName  := 'BaseDados';
      SP_PROC.StoredProcName  := 'CM.SP_FB_MAPAFOLHABENEF_V2';

      //Criando os parametros
      SP_PROC.Params.CreateParam(ftString,   'pOutERRO', ptOutput);
      SP_PROC.Params.CreateParam(ftInteger,   'pIdVersao',     ptinput);
     //Passandos os parâmetros
      SP_PROC.ParamByName('pIdVersao').asInteger  := qryFolhaEfetIDHSTFOLHABENEF.AsInteger;
      if not SP_PROC.Prepared then
         SP_PROC.Prepare;
      SP_PROC.Close;
      SP_PROC.ExecProc;

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Fim do Processamento : ' + DateTimeToStr(Now));

      {apresenta msg de erro, caso tenha ocorrido}
      sMsgErro := SP_PROC.parambyName('pOutERRO').asString;
      bErro    := (sMsgErro <> EmptyStr);
      if sMsgErro <> 'OK' then
      begin
        MsgDlg(sMsgErro, Sistema.NomeModulo, mtWarning, [mbOk], 0);
        memResult.Lines.Add('Erro ao executar o Mapa da Folha de Benenficio. Folha : ' + dblkpcmb.Text );
        memResult.Lines.Add('[ERRO ] - '+sMsgErro);
      end
      else
      begin
        memResult.Lines.Add('Mapa da Folha de Benenficio executado com SUCESSO. Folha : ' + dblkpcmb.Text);
        MsgDlg('Mapa da Folha de Benenficio executado com Sucesso', 'Informação', mtInformation, [mbOk], 0);
      end;


    except
      MsgDlg('Erro ao executar o Mapa da Folha de Benenficio.', 'Erro', mtError, [mbOk], 0);
      bbtnProcessa.Enabled:= False;
    end;

  finally
    FreeAndNil(SP_PROC);
    bbtnProcessa.Enabled:= False;
  end;
end;

procedure TfrmMapaFolhaBenef.spedAnoExit(Sender: TObject);
begin
  inherited;
  if (Trim(spedAno.Text) <> '') and  (cmbMes.Text <> '') then
  begin
      sMesRef := Trim(spedAno.Text)+ '/'+ IntCod(cmbMes.ItemIndex+1,2);
      qryFolhaEfet.close;
      qryFolhaEfet.ParamByName('pMESREFERENCIA').AsString     :=  sMesRef;
      qryFolhaEfet.open;
      memResult.Lines.Clear;
      dblkpcmb.setfocus;
  end;

end;

procedure TfrmMapaFolhaBenef.dblkpcmbClick(Sender: TObject);
begin
  inherited;
  // Preencher mes de referência
  if (Trim(cmbMes.Text) = '') or (Trim(spedAno.Text) = '')
  then begin
     MsgDlg('Preencha o mês inicialmente.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;
end;

procedure TfrmMapaFolhaBenef.FormShow(Sender: TObject);
begin
  inherited;
  spedAnoExit(Sender);
end;

end.
