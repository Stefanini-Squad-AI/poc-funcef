unit TestaTmpServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uConsPart, uCtrlTempoServico,
  DBClient, uCMClientDataSet, dBaseDados, uSistema, dConsPart;

type
  TfrmTestaTmpServico = class(TfrmSairAjuda)
    QRY: TwwQuery;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Cds: TCMClientDataSet;
    qryAux: TwwQuery;
    qryTempoespecial: TwwQuery;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bSair : Boolean;
    procedure MsgErro(sMsg: String);
    procedure ConfereTmpServ;
  public
    { Public declarations }
  end;

var
  frmTestaTmpServico: TfrmTestaTmpServico;

implementation

{$R *.DFM}

{ TfrmTestaTmpServico }

procedure TfrmTestaTmpServico.ConfereTmpServ;
var TempoCC, TempoCCMT, TempoSC, tempoSCMT, tempoSitEspecial, TempoSitEspecialMT : integer;
    CtrlTempoServico : TCtrlTempoServico;
    ConsPart1 : TconsPart;
    contaReg : integer;
begin
  bSair := false;
  TempoCC := 0;
  TempoCCMT := 0;
  TempoSC := 0;
  TempoSCMT := 0;
  TempoSitEspecial := 0;
  TempoSitEspecialMT := 0;

  ConsPart1 := Tconspart.Create(self);
  dtmConsPart := TdtmConsPart.Create(self);

  CtrlTempoServico := TCtrlTempoServico.Create;
  CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);

  qry.close;
  qry.Open;
  Memo1.lines.Clear;
  Memo1.Lines.add('----------------INÍCIO------------------');
  Memo1.Lines.add('---------------------------------+-----------------------+----------------------');
  Memo1.Lines.add('MATRÍCULA  TCC     TCCMT   DIFER | TSC     TSCMT   DIFER | TSITE   TSITEMT DIFER');
  Memo1.Lines.add('---------------------------------+-----------------------+----------------------');

  ContaReg := 0;
  qry.First;

  while (not qry.eof) and (not bsair) do
  begin
    application.processMessages;
    contaReg := ContaReg + 1;
    label1.Caption := ' Calculando '+intToStr(Contareg)+ ' de '+ intToStr(qry.RecordCount) +' registros...';
    label1.Update;
    TempoCC := 0;
    TempoCCMT := 0;
    TempoSC := 0;
    TempoSCMT := 0;
    TempoSitEspecial := 0;
    TempoSitEspecialMT := 0;

// início do cálculo em 3 camadas pega os dados calculados em 3 camadas
    Cds.Close;
    Cds.Data := CtrlTempoServico.CalculaTempos(qry.fieldByName('idpessoa').asInteger, now);
    TempoCCMT := cds.fieldByName('TEMPOSERVCALC').asInteger;
    TempoSCMT := cds.fieldByName('TEMPOSEMCONVERSAO').asInteger;
    // o tempo já foi atualizado na tabela elegpatro pelas rotinas de cálculo, é só verificar o valor
    qryTempoEspecial.close;
    qryTempoEspecial.Sql.Text := ' SELECT TEMPOSITESPECIAL FROM ELEGPATRO WHERE IDPESSOA = ' + qry.fieldByName('idpessoa').asString;
    qryTempoEspecial.open;
    TempoSitEspecialMT := qryTempoEspecial.FieldByName('TEMPOSITESPECIAL').asInteger;

// Fim do cálculo em 3 camadas pega os dados calculados em 3 camadas


// início do cálculo em 2 camadas pega os dados calculados em 3 camadas
    dtmConsPart.qryhistfunc.Close;
    dtmConsPart.qryhistfunc.ParamByName('IDTITULAR').AsFloat := qry.fieldByName('IDPESSOA').asInteger;
    dtmConsPart.qryhistfunc.ParamByName('IDPESSJUR').AsFloat := qry.fieldByName('IDPESSJUR').asInteger;
    // pega os dados calculados em 2 camadas
    UconsPart.ProcessaHistContrib(qryAux, qry.fieldByName('idpessoa').asInteger, DateToStr(now));
    dtmConsPart.qryHistFunc.Open;

    TempoCC := dtmConsPart.qryHistFuncTEMPOSERVCALC.AsInteger;
    TempoSC := dtmConsPart.qryHistFuncTEMPOSEMCONVERSAO.AsInteger;

    // o tempo já foi atualizado na tabela elegpatro pelas rotinas de cálculo, é só verificar o valor
    qryTempoEspecial.close;
    qryTempoEspecial.Sql.Text := ' SELECT TEMPOSITESPECIAL FROM ELEGPATRO WHERE IDPESSOA = ' + qry.fieldByName('idpessoa').asString;
    qryTempoEspecial.open;
    TempoSitEspecial := qryTempoEspecial.FieldByName('TEMPOSITESPECIAL').asInteger;
// Fim do cálculo em 2 camadas pega os dados calculados em 3 camadas

    Memo1.Lines.Add( qry.fieldByName('MATRICULA').asString + stringOfChar(' ', 10 - length(qry.fieldByName('MATRICULA').asString)) +' '+
                     // tempo com conversão
                     IntToStr(TempoCC) + StringOfChar(' ', 5 - length(IntToStr(TempoCC))) + ' - '+
                     IntToStr(TempoCCMT) + StringOfChar(' ', 5 - length(IntToStr(TempoCCMT))) + ' = '+
                     IntToStr(TempoCC - TempoCCMT) + StringOfChar(' ', 5 - length(IntToStr(TempoCC - TempoCCMT)))

                     +' | '+
                     // tempo sem conversão
                     IntToStr(TempoSC) + StringOfChar(' ', 5 - length(IntToStr(TempoSC))) + ' - '+
                     IntToStr(TempoSCMT) + StringOfChar(' ', 5 - length(IntToStr(TempoSCMT))) + ' = '+
                     IntToStr(TempoSC - TempoSCMT) + StringOfChar(' ', 5 - length(IntToStr(TempoSC - TempoSCMT)))
                     +' | '+
                     // tempositEspecial
                     IntToStr(TempoSitEspecial) + StringOfChar(' ', 5 - length(IntToStr(TempoSitEspecial))) + ' - '+
                     IntToStr(TempoSitEspecialMT) + StringOfChar(' ', 5 - length(IntToStr(TempoSitEspecialMT))) + ' = '+
                     IntToStr(TempoSitEspecial - TempoSitEspecialMT) + StringOfChar(' ', 5 - length(IntToStr(TempoSitEspecial - TempoSitEspecialMT)))


                     );

    qry.next;

  end;
  Memo1.Lines.add('----------------FIM------------------');
  Memo1.Lines.SaveToFile('TempoServico.txt');
  FreeAndNil(CtrlTempoServico);
  FreeAndNil(ConsPart1);
  FreeAndNil(dtmConsPart);
end;


procedure TfrmTestaTmpServico.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;


procedure TfrmTestaTmpServico.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ConfereTmpServ;
end;

procedure TfrmTestaTmpServico.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Memo1.Lines.SaveToFile('TempoServico.txt'); 
end;

procedure TfrmTestaTmpServico.bbtnSairClick(Sender: TObject);
begin
  bSair := true;
end;

procedure TfrmTestaTmpServico.FormCreate(Sender: TObject);
begin
  inherited;
  bSair := False;
end;

end.
