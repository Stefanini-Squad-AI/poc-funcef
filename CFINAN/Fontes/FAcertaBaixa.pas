unit FAcertaBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrlt, ComCtrls, Db, DBTables, Wwquery;

type
  TfrmAcertaBaixa = class(TfrmOkCancelar)
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    deDataFim: TCMDateTimePicker;
    deDataIni: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    qryPlanil: TwwQuery;
    qry: TwwQuery;
    prgBarAtuFluxo: TProgressBar;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaBaixa: TfrmAcertaBaixa;

implementation

{$R *.DFM}
uses uMensErro,uDataBase, DBaseDados,uSistema,uFuncaoGeral,
     uLancContab,UIntegraBack;


procedure TfrmAcertaBaixa.bbtnConfirmarClick(Sender: TObject);
var rValorLanc : Real;
    liExercicio,liperiodo,liempresa,liRetFuncao,iPlanilha  : LongInt;
    sMens      : String;
begin
  inherited;
  //
  bbtnConfirmar.Enabled  := False;
  liEmpresa:=Sistema.idEmpresa;
  //
  qry.Close;
  qry.ParamByName('IDPESSOA').AsInteger:= Sistema.idEmpresa;
  qry.ParamByName('DATAINI').AsString  := deDataIni.Text;
  qry.ParamByName('DATAFIM').AsString  := deDataFim.Text;
  qry.Open;
  if qry.IsEmpty then begin
     MsgDlg('Não existe nenhum Lançamento neste Período','Erro',mtError,[mbOk],0);
     bbtnConfirmar.Enabled  := True;
     Exit;
  end;
  //
  prgBarAtuFluxo.Visible := True;
  prgBarAtuFluxo.Max      :=qry.RecordCount;
  prgBarAtuFluxo.Position :=0;
  Try
     StartTransacao;
     qry.First;
     While not qry.EOF do begin
        prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
        //
        qryPlanil.Close;
        qryPlanil.ParamByName('PLNCODIGO').AsInteger := qry.FieldByName('PLNCODIGO').AsInteger;
        qryPlanil.ParamByName('PLACONTA').AsString   := trim(qry.FieldByName('PLACONTA').AsString);
        qryPlanil.Open;
        //
        rValorLanc:=0;
        qryPlanil.First;
        While not qryPlanil.EOF do begin
           if qryPlanil.FieldByName('LACDEBCRE').AsString = 'D' then begin
              rValorLanc:=rValorLanc+qryPlanil.FieldByName('LACVALOR').AsFloat;
           end else begin
              rValorLanc:=rValorLanc-qryPlanil.FieldByName('LACVALOR').AsFloat;
           end;
           liRetFuncao:=TestaPeriodo(True,'BASEDADOS',
                                     qryPlanil.FieldByName('PLNDATDIA').AsString,
                                     qryPlanil.FieldByName('IDMODULO').AsString,
                                     liExercicio,liperiodo,liempresa,sMens);
           if liRetFuncao <> 0 then
              Abort;
           ExcluiLanc(True,qryPlanil.FieldByName('PLNCODIGO').AsInteger,'BASEDADOS',
                      qryPlanil.FieldByName('IDMODULO').AsString,IntegraBack.Plano,
                      Sistema.idEmpresa,Sistema.idUsuario,False,qryPlanil.FieldByName('LACNUMLAN').AsInteger,
                      IntegraBack.MascaraPlano);
           qryPlanil.Next;
        end;
        qryPlanil.First;
        iPlanilha:=qry.FieldByName('PLNCODIGO').AsInteger;
        iPlanilha:=LancaContab(True,'BASEDADOS',qryPlanil.FieldByName('PLNDATDIA').AsString,
                    qryPlanil.FieldByName('IDMODULO').AsString,'0','D','','',
                    '','','','','','','','',qryPlanil.FieldByName('LACNUMDOC').AsString,
                    qryPlanil.FieldByName('LACHIST1').AsString,qryPlanil.FieldByName('LACHIST2').AsString,
                    qryPlanil.FieldByName('LACHIST3').AsString,qryPlanil.FieldByName('LACHIST4').AsString,
                    qryPlanil.FieldByName('LACHIST5').AsString,'03','',qryPlanil.FieldByName('PLACONTA').AsString,
                    '','',qryPlanil.FieldByName('PEREXERCICIO').AsInteger,qryPlanil.FieldByName('PERNUMERO').AsInteger,
                    Sistema.idEmpresa,Sistema.idUsuario,IntegraBack.Plano,rValorLanc,0,0,0,0,0,0,0,0,
                    qry.FieldByName('UNIDNEGOC').AsString,True,0,0,'','','','',iPlanilha,sMens,
                    IntegraBack.MascaraPlano,True,qryPlanil.FieldByName('LACNUMLAN').AsInteger);
        if iPlanilha <= 0 then
           Abort;
        qry.Next;
     end;
     CommitTransacao;
     MsgDlg('Acerto das Baixas Efetuado com Sucesso','Aviso',mtWarning,[mbOk],0);
     prgBarAtuFluxo.Visible := False;
     bbtnConfirmar.Enabled  := True;
  Except
     RollBackTransacao;
     MsgDlg('Acerto das Baixas não Efetuado','Erro',mtError,[mbOk],0);
     prgBarAtuFluxo.Visible := False;
     bbtnConfirmar.Enabled  := True;
     Raise;
  end;
end;

end.
