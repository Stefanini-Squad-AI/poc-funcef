unit FParamRContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, wwdblook;

type
  TfrmParamRContab = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    qryAuxContab: TwwQuery;
    qryAux: TwwQuery;
    GroupBox2: TGroupBox;
    dblcPortador: TwwDBLookupCombo;
    qryPortador: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRContab: TfrmParamRContab;

implementation

Uses uSistema,dRelatoriosCFinan;
{$R *.DFM}

procedure TfrmParamRContab.FormCreate(Sender: TObject);
begin
   inherited;
   qryPortador.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryPortador.Open;
end;

procedure TfrmParamRContab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPortador.Close;
  qryAux.Close;
  qryAux.UnPrepare;
end;

procedure TfrmParamRContab.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  qryAux.Close;
  qryAux.Prepare;
  //
  dtmRelatoriosCFinan.qryPrevisao.Close;
  dtmRelatoriosCFinan.qryPrevisao.ParamByName('SDATAREF').AsString := DateToStr(Date);
  dtmRelatoriosCFinan.qryPrevisao.ParamByName('IDPessoa').AsFloat := Sistema.IdEmpresa;  
  dtmRelatoriosCFinan.qryPrevisao.Open;
  //

  dtmRelatoriosCFinan.qryContabilidade.Close;
  dtmRelatoriosCFinan.qryContabilidade.Open; //Vazio
  dtmRelatoriosCFinan.ppLabel30.Caption:=deDataInicial.Text+' a '+deDataFinal.Text;

  qryAuxContab.Close;
  if (Trim(dblcPortador.Text)<>'') then
     qryAuxContab.ParamByName('pCodPortador').AsFloat:=StrToFloat(dblcPortador.LookupValue)
  else
     qryAuxContab.ParamByName('pCodPortador').AsFloat:=0;

  qryAuxContab.ParamByName('pIdEmpresa').Value:=Sistema.idEmpresa;
  qryAuxContab.ParamByName('pDataIni').Value  :=deDataInicial.Text;
  qryAuxContab.ParamByName('pDataFim').Value  :=deDataFinal.Text;
  qryAuxContab.Open;
  qryAuxContab.First;
  //Saldo Anterior
  dtmRelatoriosCFinan.qryContabilidade.Append;
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('LACVALOR').AsFloat  := qryAuxContab.FieldByName('SALDOANT').AsFloat;
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('HISTORICO').AsString:= 'Saldo Anterior';
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('DATALANC').AsString := deDataInicial.Text;
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('DATACONT').AsString:= deDataInicial.Text;
  dtmRelatoriosCFinan.qryContabilidade.Post;
  While not qryAuxContab.EOF do
  Begin
     if not qryAuxContab.FieldByName('CODPLANILHA').isNull then
     begin
        qryAux.Close;
        qryAux.ParamByName('pPlnCodigo').Value:=qryAuxContab.FieldByName('CODPLANILHA').Value;
        qryAux.ParamByName('pPlaConta').Value :=qryAuxContab.FieldByName('PLACONTA').Value;
        qryAux.Open;
        //
        qryAux.First;
        while not qryAux.EOF do
        begin
           dtmRelatoriosCFinan.qryContabilidade.Append;
           if ((qryAux.FieldByName('LACDEBCRE').AsString = 'D') and
               (qryAuxContab.FieldByName('ENTRADASAIDA').AsString = 'E')) or
              ((qryAux.FieldByName('LACDEBCRE').AsString = 'C') and
               (qryAuxContab.FieldByName('ENTRADASAIDA').AsString = 'S')) then
            begin
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('LACVALOR').AsFloat:=
                                   -qryAux.FieldByName('LACVALOR').AsFloat;
            end
           else
            begin
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('LACVALOR').AsFloat:=
                      qryAux.FieldByName('LACVALOR').AsFloat;
            end;

           if qryAuxContab.FieldByName('ENTRADASAIDA').AsString = 'E' then
            begin
              dtmRelatoriosCFinan.qryContabilidade.FieldByName('CONTAC').AsString:=
                                  qryAux.FieldByName('PLACONTA').AsString;
              dtmRelatoriosCFinan.qryContabilidade.FieldByName('NOMECONTAC').AsString:=
                                  qryAux.FieldByName('NOME').AsString;
              dtmRelatoriosCFinan.qryContabilidade.FieldByName('CONTAD').AsString:=
                                  qryAuxContab.FieldByName('PLACONTA').AsString;
              dtmRelatoriosCFinan.qryContabilidade.FieldByName('NOMECONTAD').AsString:=
                                  qryAuxContab.FieldByName('PLANOME').AsString;
              dtmRelatoriosCFinan.qryContabilidade.FieldByName('ENTRADASAIDA').AsString:='ENTRADAS';
            end
           else
            begin
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('CONTAD').AsString:=
                                   qryAux.FieldByName('PLACONTA').AsString;
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('NOMECONTAD').AsString:=
                                   qryAux.FieldByName('NOME').AsString;
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('CONTAC').AsString:=
                                   qryAuxContab.FieldByName('PLACONTA').AsString;
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('NOMECONTAC').AsString:=
                                   qryAuxContab.FieldByName('PLANOME').AsString;
               dtmRelatoriosCFinan.qryContabilidade.FieldByName('ENTRADASAIDA').AsString :='SAIDAS';
            end;

           dtmRelatoriosCFinan.qryContabilidade.FieldByName('HISTORICO').AsString:=
                               qryAuxContab.FieldByName('HISTORICO').AsString;
           dtmRelatoriosCFinan.qryContabilidade.FieldByName('PLNPLANIL').AsInteger:=
                               qryAux.FieldByName('PLNPLANIL').AsInteger;
           dtmRelatoriosCFinan.qryContabilidade.FieldByName('DATALANC').AsString:=
                               qryAuxContab.FieldByName('DATALANCFINAN').AsString;
           dtmRelatoriosCFinan.qryContabilidade.FieldByName('DATACONT').AsString:=
                               qryAux.FieldByName('PLNDATDIA').AsString;
           dtmRelatoriosCFinan.qryContabilidade.Post;
           qryAux.Next;
        end;
     end;
     qryAuxContab.Next;
  end;
  dtmRelatoriosCFinan.qryContabilidade.Append;
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('LACVALOR').AsFloat  := qryAuxContab.FieldByName('SALDOFINAL').AsFloat;
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('HISTORICO').AsString:= 'Saldo Final';
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('DATALANC').AsString := deDataFinal.Text;
  dtmRelatoriosCFinan.qryContabilidade.FieldByName('DATACONT').AsString:= deDataFinal.Text;
  dtmRelatoriosCFinan.qryContabilidade.Post;
end;

end.
