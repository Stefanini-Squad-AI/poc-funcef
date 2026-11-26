unit FCadSaidaGenerica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn,
  TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, uMensErro, Mask, wwdbedit, uDataBase,
  fcLabel, Wwdotdot, Wwdbcomb;

type
  TFrmCadSaidaGenerica = class(TfrmCadMestreDetalheCS)
    memSql: TMemo;
    btnAnalisar: TBitBtn;
    qryAux: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    lblSql: TLabel;
    lblCodSaida: TLabel;
    lblDescricao: TLabel;
    dbeDescricao: TwwDBEdit;
    dbeIdSaida: TwwDBEdit;
    lblCampo: TLabel;
    dbeComponente: TwwDBEdit;
    lblCaracteristica: TLabel;
    dbcbCaracteristica: TwwDBComboBox;
    Label1: TLabel;
    dbcbTipo: TwwDBComboBox;
    dbeMascara: TwwDBEdit;
    fclblMascara: TfcLabel;
    Label2: TLabel;
    dbePosicao: TwwDBEdit;
    qrySQL: TwwQuery;
    lblNome: TLabel;
    dbeNome: TwwDBEdit;
    procedure btnAnalisarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    iIdSaida: Integer;
    iIdComponente: integer;
    FFazerApplyDetalhe: boolean;
    function PegaMaiorComponente: integer;
    procedure SetFazerApplyDetalhe(const Value: boolean);
  public
    { Public declarations }
    property FazerApplyDetalhe: boolean read FFazerApplyDetalhe write SetFazerApplyDetalhe;
  end;

var
  FrmCadSaidaGenerica: TFrmCadSaidaGenerica;

implementation

{$R *.DFM}

procedure TFrmCadSaidaGenerica.btnAnalisarClick(Sender: TObject);
 var ssql: string;
     lii: integer;
begin
  inherited;
  ssql:=memSql.Lines.Text;

  if Trim(ssql) = '' Then
  begin
    MsgDlg('Nenhuma consulta SQL para analisar.', 'Informação',
      mtInformation, [mbOk], 0);
  end
  else
  begin
    try
      qrySQL.close;
      qrySQL.Sql.Clear;
      qrySQL.Sql.Add(ssql+' AND 1 = 2');
      qrySQL.prepare;
      for lii:=0 to qrySQL.params.count-1 do
      begin
        qrySQL.params[lii].datatype:=ftstring;
        qrySQL.params[lii].clear;
      end;
      qrySQL.open;
      for lii:=0 to qrySQL.fields.count-1 do
      begin
        ssql:=qrySQL.fields[lii].fieldname;
      end;

      if MsgDlg('Deseja incluir os campos e parâmetros da consulta ?',
                'Pergunta', mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        FazerApplyDetalhe:=true;
        for lii:=0 to qrySQL.fields.count-1 do
        begin
          qryDet.insert;
          qryDet.fieldbyname('IDSAIDA').AsInteger:=iIdSaida;
          qryDet.fieldbyname('IDCOMPONENTE').asinteger:=iIdComponente;
          iIdComponente:=iIdComponente+1;
          qryDet.fieldbyname('NOMECOMPONENTE').asstring:=qrySQL.fields[lii].fieldname;
          qryDet.fieldbyname('CARACTERISTICA').asstring:='C';
          qryDet.fieldbyname('TIPO').asstring:='T';
          qryDet.fieldbyname('MASCARASAIDA').asstring:='E1';
          qryDet.fieldbyname('POSICAOINICIAL').asinteger:=lii+1;
          qryDet.post;
        end;
        for lii:=0 to qrySQL.params.count-1 do
        begin
          qryDet.insert;
          qryDet.fieldbyname('IDSAIDA').AsInteger:=iIdSaida;
          qryDet.fieldbyname('IDCOMPONENTE').asinteger:=iIdComponente;
          iIdComponente:=iIdComponente+1;
          qryDet.fieldbyname('NOMECOMPONENTE').asstring:=qrySQL.params[lii].Name;
          qryDet.fieldbyname('CARACTERISTICA').asstring:='P';
          qryDet.fieldbyname('TIPO').asstring:='T';
          qryDet.fieldbyname('MASCARASAIDA').clear;
          qryDet.fieldbyname('POSICAOINICIAL').clear;
          qryDet.post;
        end;
      end;
      qrySQL.close;
    except
      MsgDlg('Comando sql, não executado corretamente.', 'Informação', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TFrmCadSaidaGenerica.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    iIdSaida:=StrToInt(MontaSelect.ValoresChave[0]);
    qry.Close;
    qry.ParamByName('IDSAIDA').AsInteger:=iIdSaida;
    qry.Open;
    qryDet.Close;
    qryDet.ParamByName('IDSAIDA').AsInteger:=iIdSaida;
    qryDet.Open;
    memSql.lines.Text:=qry.FieldByName('SQL').AsString;
  End;
end;

procedure TFrmCadSaidaGenerica.FormShow(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDSAIDA').AsInteger:=-1;
  qry.Open;
  qryDet.Close;
  qryDet.ParamByName('IDSAIDA').AsInteger:=-1;
  qryDet.Open;
  WindowState:=wsMaximized;
end;

procedure TFrmCadSaidaGenerica.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  memSql.SetFocus;
  iIdSaida:=LeUltRegistro(Nil,'SAIDAGENERICA');
  qry.fieldbyname('IDSAIDA').AsInteger:=iIdSaida;
  qryDet.Close;
  qryDet.ParamByName('IDSAIDA').AsInteger:=iIdSaida;
  qryDet.Open;
  dbeIdSaida.Text:=IntToStr(iIdSaida);
end;

procedure TFrmCadSaidaGenerica.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.fieldbyname('IDSAIDA').AsInteger:=iIdSaida;
  qryDet.fieldbyname('IDCOMPONENTE').AsInteger:=iIdComponente;
  iIdComponente:=iIdComponente+1;
end;

procedure TFrmCadSaidaGenerica.qryDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  iIdComponente:=PegaMaiorComponente;
end;

function TFrmCadSaidaGenerica.PegaMaiorComponente: integer;
begin
  result:=0;
  if FazQuery(qryAux, 'SELECT MAX(IDCOMPONENTE) '+
                      'FROM SAIDAGENERICADET '+
                      'WHERE IDSAIDA = '+inttostr(iIdSaida)) then
    result:=qryaux.fields[0].asinteger+1;
end;

procedure TFrmCadSaidaGenerica.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept:=(trim(dbcbCaracteristica.text) <> '') and
          (trim(dbcbTipo.text)           <> '') and
          (trim(dbePosicao.text)         <> '') and
          (trim(dbeMascara.text)         <> '');
end;

procedure TFrmCadSaidaGenerica.CmeCadastroConfirma(Sender: TObject);
begin
  if FazerApplyDetalhe then
    qryDet.applyupdates;
  qry.FieldByName('SQL').AsString:=memSql.lines.Text;
  inherited;
end;

procedure TFrmCadSaidaGenerica.SetFazerApplyDetalhe(const Value: boolean);
begin
  FFazerApplyDetalhe := Value;
end;

end.
