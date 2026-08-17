{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Regularização de Adiantamento e Previsão            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 09/10/2002                             }
{                                                       }
{*******************************************************}

unit FRegPrevAdiantoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwdbigrd, Wwdbgrid,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, IvDictio,
  IvMulti, IvEMulti, Grids, uCtrlDocumento;

type
  TFrmRegPrevAdiantoMT = class(TfrmOkCancelar)
    Panel5: TPanel;
    LbldocEscluidos: TPanel;
    dbgrPrevPendente: TwwDBGrid;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox2: TGroupBox;
    DbreValRegPrev: TDBRealEdit;
    Panel1: TPanel;
    LblDocPagos: TPanel;
    dbgrAdtoPendente: TwwDBGrid;
    Panel2: TPanel;
    SbAdInverte: TSpeedButton;
    SbAdTodos: TSpeedButton;
    GroupBox1: TGroupBox;
    DbreValRegAdt: TDBRealEdit;
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrPrevPendenteDblClick(Sender: TObject);
  private
    _Documento: TCtrlDocumento;
    procedure CalculaSaldo;
    procedure InverteSelecao(Dts: TDataSet);
    procedure SelecionaTodos(Dts: TDataSet);
    function RegularizaPrevisao:Boolean;
  public
    { Public declarations }
  end;

var
  FrmRegPrevAdiantoMT: TFrmRegPrevAdiantoMT;

implementation

uses FLancDocCAPCARMT, uMensErro, uModulo, uSistema, uDataBase, DCapCarMT,
     uCtrlParamIntegra, uCtrlPadroes, JclMath;

{$R *.DFM}

procedure TFrmRegPrevAdiantoMT.SelecionaTodos(Dts: TDataSet);
begin
  inherited;
  Dts.First;
  While Not Dts.Eof Do
  Begin
    Dts.Edit;
    Dts.FieldByName('STATUS').AsString := '2';
    Dts.Post;
    Dts.Next;
  End;
end;

procedure TFrmRegPrevAdiantoMT.InverteSelecao(Dts: TDataSet);
begin
  inherited;
  Dts.First;
  While Not Dts.Eof Do
  Begin
    Dts.Edit;
    If Dts.FieldByName('STATUS').AsString = '2' Then
       Dts.FieldByName('STATUS').AsString := '0'
    Else
       Dts.FieldByName('STATUS').AsString := '2';
    Dts.Post;
    Dts.Next;
  End;

end;

procedure TFrmRegPrevAdiantoMT.SbAdTodosClick(Sender: TObject);
begin
  inherited;
  SelecionaTodos(DtmCapCarMT.CdsAdtoPendente);
end;

procedure TFrmRegPrevAdiantoMT.SbAdInverteClick(Sender: TObject);
begin
  inherited;
  InverteSelecao(DtmCapCarMT.CdsAdtoPendente);
end;

procedure TFrmRegPrevAdiantoMT.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  SelecionaTodos(DtmCapCarMT.CdsPrevPendente);
end;

procedure TFrmRegPrevAdiantoMT.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  InverteSelecao(DtmCapCarMT.CdsPrevPendente);
end;


procedure TFrmRegPrevAdiantoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If RegularizaPrevisao Then Close;
end;

Function TFrmRegPrevAdiantoMT.RegularizaPrevisao: Boolean;
Begin
  Try
   DtmCapCarMT.CdsPrevPendente.First;

   While Not DtmCapCarMT.CdsPrevPendente.Eof Do
   Begin

     If DtmCapCarMT.CdsPrevPendente.FieldByName('STATUS').AsString = '2' Then
     Begin
       If DtmCapCarMT.CdsPrevPendente.FieldByName('DATALANCTO').AsDateTime < frmLancDocCAPCAR.Cds.FieldByName('DATALANCTO').AsDateTime Then
          MsgDlg('A Data de quebra do Contrato ' + DtmCapCarMT.CdsPrevPendente.FieldByName('DOCUM').AsString + ' é menor que a data de lançamento do documento','Atenção',mtInformation,[mbOk],0);
     End;

     DtmCapCarMT.CdsPrevPendente.Next;
   End;

   Result := True;
  Except
     MsgDlg('Regularização de Previsão não Efetuada','Erro',mtError,[mbOk],0);
     Raise;
  end;
End;

procedure TFrmRegPrevAdiantoMT.FormCreate(Sender: TObject);
Var
  sSql: String;
begin
  inherited;
  _Documento := TCtrlDocumento.Create;;
  _Documento.InitializeAs(Padroes);


  sSql :=
  ' SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, (0) AS VALRES, (0) VLRBAIXA,L.DATALANCTO, ' +
  ' D.DATAVENCTO, RTRIM(TO_CHAR(D.NODOCUMENTO)) || '' '' || D.COMPLDOCUMENTO as DOCUM ' +
  ' FROM DOCUMENTO D, LANCTODOCUM L, ' +
  ' PESSOA P ' +
  ' WHERE (D.IDPESSOA = :IDEMPRESA) AND ' +
  ' (D.RECPAG = :RECPAG) AND ' +
  ' (D.STATUS <> ''2'' OR D.STATUS IS NULL)  AND ' +
  ' (L.OPERACAO = ''15'') AND ' +
  ' (D.IDFORCLI = :IDFORCLI) AND ' +
  ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
  ' (P.IDPESSOA = D.IDFORCLI) ';

  If ParamIntegra.RecPag = 'R' Then
     sSql := sSql +
     ' UNION ' +
     ' SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, (0) AS VALRES, (0) VLRBAIXA, L.DATALANCTO, ' +
     ' D.DATAVENCTO, RTRIM(TO_CHAR(D.NODOCUMENTO)) || '' '' || D.COMPLDOCUMENTO as DOCUM ' +
     ' FROM DOCUMENTO D, LANCTODOCUM L, CLIENTEPESS C, PESSOA P ' +
     '  WHERE (D.IDPESSOA = :IDEMPRESA) AND ' +
     '  (D.RECPAG = :RECPAG) AND ' +
     '  (D.STATUS <> ''2'' OR D.STATUS IS NULL)  AND ' +
     '  (L.OPERACAO = ''15'') AND ' +
     '  (C.IDTIPOCLIENTE = :idTipoCliAd) AND ' +
     '  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
     '  (P.IDPESSOA = D.IDFORCLI) AND ' +
     '  (C.IDPESSOA = D.IDFORCLI) '
  Else
     sSql := sSql +
     'UNION ' +
     ' SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, (0) AS VALRES, (0) VLRBAIXA,L.DATALANCTO, ' +
     ' D.DATAVENCTO, RTRIM(TO_CHAR(D.NODOCUMENTO)) || '' '' || D.COMPLDOCUMENTO as DOCUM ' +
     ' FROM DOCUMENTO D, LANCTODOCUM L, ' +
     ' PESSOA P ' +
     ' WHERE (D.IDPESSOA = :IDEMPRESA) AND ' +
     ' (D.RECPAG = :RECPAG) AND ' +
     ' (D.STATUS <> ''2'' OR D.STATUS IS NULL)  AND ' +
     ' (L.OPERACAO = ''15'') AND ' +
     ' (D.IdForCli IN (SELECT IDPESSOA FROM FORNXRAMO WHERE IDRAMOFORNECEDOR = ' + IntToStr(Modulo.RamoFornAdianto) + ')) AND ' +
     ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
     ' (P.IDPESSOA = D.IDFORCLI)';

  DtmCapCarMT.SQLAdtoPendente.Sql.Clear;
  DtmCapCarMT.SQLAdtoPendente.Sql.Text := sSql;
  DtmCapCarMT.SQLAdtoPendente.Prepare;
  DtmCapCarMT.SQLAdtoPendente.ParamByName('IDEMPRESA').AsFloat :=Sistema.IdEmpresa;
  DtmCapCarMT.SQLAdtoPendente.ParamByName('IDFORCLI').AsFloat := frmLancDocCAPCAR.Cds.FieldByName('IDFORCLI').AsFloat;
  If ParamIntegra.RecPag = 'R' Then
     DtmCapCarMT.SQLAdtoPendente.ParamByName('idTipoCliAd').AsFloat := Modulo.IdTipoCliAdianto;
  DtmCapCarMT.SQLAdtoPendente.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  DtmCapCarMT.SQLAdtoPendente.Open;

  sSql := 'SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, S.VALRES,'+
          'S.VALRES as VLRBAIXA,L.DATALANCTO, D.DATAVENCTO, D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM  '+
          ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P,'+
          '(SELECT CODDOCUMENTO, DECODE(:RECPAG,''R'',SUM(DECODE(DEBCRE,''D'',VALOR,VALOR*-1)),'+
          'SUM(DECODE(DEBCRE,''D'',VALOR*-1,VALOR))) AS VALRES'+
          ' FROM LANCTODOCUM GROUP BY CODDOCUMENTO) S  '+
          ' WHERE (D.IDPESSOA = :IDEMPRESA) AND  '+
          ' (D.RECPAG = :RECPAG) AND  '+
          ' (D.IDFORCLI = :IDFORCLI) AND  '+
          ' (D.STATUS <> ''2'' OR D.STATUS IS NULL) AND  '+
          ' (L.OPERACAO = ''11'' OR L.OPERACAO = ''12'' OR L.OPERACAO = ''13'') AND '+
          ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND  '+
          ' (P.IDPESSOA = D.IDFORCLI) AND  '+
          ' (S.CODDOCUMENTO = D.CODDOCUMENTO)  '+
          'union ';
  if ParamIntegra.recpag='P' then
  begin
          sSql :=sSql+
          'SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, S.VALRES,'+
          'S.VALRES as VLRBAIXA,L.DATALANCTO, D.DATAVENCTO, D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM  '+
          ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P,'+
          '(SELECT CODDOCUMENTO, DECODE(:RECPAG,''R'',SUM(DECODE(DEBCRE,''D'',VALOR,VALOR*-1)),'+
          'SUM(DECODE(DEBCRE,''D'',VALOR*-1,VALOR))) AS VALRES'+
          ' FROM LANCTODOCUM GROUP BY CODDOCUMENTO) S  '+
          ' WHERE (D.IDPESSOA = :IDEMPRESA) AND  '+
          ' (D.RECPAG = :RECPAG) AND  '+
          ' (D.IdForCli IN (SELECT IDPESSOA FROM FORNXRAMO WHERE IDRAMOFORNECEDOR = ' + IntToStr(Modulo.RamoFornAdianto) + ')) AND ' +
          ' (D.STATUS <> ''2'' OR D.STATUS IS NULL) AND  '+
          ' (L.OPERACAO = ''11'' OR L.OPERACAO = ''12'' OR L.OPERACAO = ''13'') AND '+
          ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND  '+
          ' (P.IDPESSOA = D.IDFORCLI) AND  '+
          ' (S.CODDOCUMENTO = D.CODDOCUMENTO)  ';

  end
  else
  begin
          sSql :=sSql+
          'SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, S.VALRES,'+
          'S.VALRES as VLRBAIXA,L.DATALANCTO, D.DATAVENCTO, D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM  '+
          ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P,'+
          '(SELECT CODDOCUMENTO, DECODE(:RECPAG,''R'',SUM(DECODE(DEBCRE,''D'',VALOR,VALOR*-1)),'+
          'SUM(DECODE(DEBCRE,''D'',VALOR*-1,VALOR))) AS VALRES'+
          ' FROM LANCTODOCUM GROUP BY CODDOCUMENTO) S  '+
          ' WHERE (D.IDPESSOA = :IDEMPRESA) AND  '+
          ' (D.RECPAG = :RECPAG) AND  '+
          ' (D.IdForCli IN (SELECT IDPESSOA FROM CLIENTEPESS WHERE IDTIPOCLIENTE = ' + IntToStr(Modulo.IdTipoCliAdianto) + ')) AND ' +
          ' (D.STATUS <> ''2'' OR D.STATUS IS NULL) AND  '+
          ' (L.OPERACAO = ''11'' OR L.OPERACAO = ''12'' OR L.OPERACAO = ''13'') AND '+
          ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND  '+
          ' (P.IDPESSOA = D.IDFORCLI) AND  '+
          ' (S.CODDOCUMENTO = D.CODDOCUMENTO)  ';
  end;
  sSql :=sSql+ ' ORDER BY NODOCUMENTO  ';


  DtmCapCarMT.SQLPrevPendente.Sql.Clear;
  DtmCapCarMT.SQLPrevPendente.sql.text:= sSql;
  DtmCapCarMT.SQLPrevPendente.Prepare;
  DtmCapCarMT.SQLPrevPendente.ParamByName('IDEMPRESA').AsFloat :=Sistema.IdEmpresa;
  DtmCapCarMT.SQLPrevPendente.ParamByName('IDFORCLI').AsFloat := frmLancDocCAPCAR.Cds.FieldByName('IDFORCLI').AsFloat;
  DtmCapCarMT.SQLPrevPendente.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  DtmCapCarMT.SQLPrevPendente.Open;

  CalculaSaldo;
end;

procedure TFrmRegPrevAdiantoMT.dbgrPrevPendenteDblClick(Sender: TObject);
begin
  inherited;
  If Not (Sender as TwwDbGrid).DataSource.DataSet.IsEmpty Then
  Begin
     (Sender as TwwDbGrid).DataSource.DataSet.Edit;

     If (Sender as TwwDbGrid).DataSource.DataSet.FieldByName('STATUS').AsInteger = 0 Then
        (Sender as TwwDbGrid).DataSource.DataSet.FieldByName('STATUS').AsInteger := 2
     Else
        (Sender as TwwDbGrid).DataSource.DataSet.FieldByName('STATUS').AsInteger := 0;

     (Sender as TwwDbGrid).DataSource.DataSet.Post;
  End;
end;


procedure TFrmRegPrevAdiantoMT.CalculaSaldo;

Begin
  DtmCapCarMT.CdsAdtoPendente.First;
  While Not DtmCapCarMT.CdsAdtoPendente.Eof Do
  Begin
    _Documento.Saldo.CalculaSaldo(DtmCapCarMT.CdsAdtoPendente.FieldByName('CODDOCUMENTO').AsInteger);
    
    If IsFloatZero(_Documento.Saldo.Valor) Then
       DtmCapCarMT.CdsAdtoPendente.Delete
    Else
    Begin
       DtmCapCarMT.CdsAdtoPendente.Edit;
       DtmCapCarMT.CdsAdtoPendente.FieldByName('VLRBAIXA').AsFloat := _Documento.Saldo.Valor * -1;
       DtmCapCarMT.CdsAdtoPendente.FieldByName('VALRES').AsFloat := _Documento.Saldo.Valor * -1;
       DtmCapCarMT.CdsAdtoPendente.Post;
       DtmCapCarMT.CdsAdtoPendente.Next;
    End;
  End;
  DtmCapCarMT.CdsAdtoPendente.First;
End;

end.
