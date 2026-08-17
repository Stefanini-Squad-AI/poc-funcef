{
--------------------------------------------------------------------------------

              TELA DE SELEÇÃO DE CIDADES PARA
              EMISSAO DE DEMONSTRATIVODS DE PAGAMENTO (FDemPag.pas)

              SOL             :  206183
              Kintana         :  1996389
              Módulo          :  Folha
              Autor           :  Helio Lima Custodio
              Data de Término :  16/06/2014

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FDemPagSelEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, Db,
  Wwdatsrc, Wwquery, uSistema;

type
  TFrmDemPagSelEstado = class(TfrmOkCancelar)
    wwDBEstado: TwwDBGrid;
    qryEstado: TwwQuery;
    dsEstado: TwwDataSource;
    updEstado: TUpdateSQL;
    qryEstadoFLGENVIAR: TFloatField;
    qryEstadoIDESTADO: TFloatField;
    qryEstadoCODESTADO: TStringField;
    qryEstadoNOMEESTADO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure wwDBEstadoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

    
    function TemEstadoSelecionado(): Boolean;
    procedure FormDestroy(Sender: TObject);

    procedure LimpaMarcacoes;
  private
    FListaIDPessoasPermitidas : TStringList;
    FListaCodEstadosSelecionados : TStringList;
    FListaEstadosDisponiveis     : TStringList;

    FRetornouValor : boolean;
    { Private declarations }
  public

    property ListaIDPessoasPermitidas    : TStringList read FListaIDPessoasPermitidas;
    property ListaCodEstadosSelecionados : TStringList read FListaCodEstadosSelecionados;

    property ListaCodEstadosPermitidos : TStringList read FListaCodEstadosSelecionados;

    property RetornouValor : Boolean read FRetornouValor;
    { Public declarations }
  end;

var
  FrmDemPagSelEstado: TFrmDemPagSelEstado;

implementation

uses uMensErro;
{$R *.DFM}

procedure TFrmDemPagSelEstado.FormShow(Sender: TObject);
var i : Integer;
begin
  inherited;

  if FListaIDPessoasPermitidas.Count > 0 then
  begin
     qryEstado.SQL.Clear;

     qryEstado.SQL.Text := ' SELECT DISTINCT  ' +#13+
                           '   0 AS FLGENVIAR, ' +#13+
                           '   CASE WHEN E.IDESTADO IS NULL THEN E1.IDESTADO ' +#13+
                           '   ELSE E.IDESTADO END AS IDESTADO, ' +#13+
                           '   CASE WHEN E.IDESTADO IS NULL THEN E1.CODESTADO ' +#13+
                           '   ELSE E.CODESTADO END AS CODESTADO, ' +#13+
                           '   CASE WHEN E.IDESTADO IS NULL THEN E1.NOMEESTADO ' +#13+
                           '   ELSE E.NOMEESTADO END AS NOMEESTADO ' +#13+
                           ' FROM PESSOA P, ENDPESS EN, ENDPESS EN1, ESTADO E, ESTADO E1 ' +#13+
                           '   WHERE P.IDENDRESIDENCIAL = EN1.IDENDERECO(+) ' +#13+
                           '   AND P.IDENDCORRESP     = EN.IDENDERECO(+) ' +#13+
                           '   AND EN.CODESTADO        = E.CODESTADO(+)  ' +#13+
                           '   AND EN1.CODESTADO       = E1.CODESTADO(+)  ' +#13+
                           '   AND (E.IDESTADO IS NOT NULL OR E1.IDESTADO IS NOT NULL) ' +#13+
                           '   AND  P.IDPESSOA IN (' +#13;


     for i := 0 to FListaIDPessoasPermitidas.Count -1 do
     begin
         qryEstado.SQL.Text := qryEstado.SQL.Text + QuotedStr(FListaIDPessoasPermitidas[i]) + ', ' + #13;
     end;

     qryEstado.SQL.Text := qryEstado.SQL.Text + QuotedStr(FListaIDPessoasPermitidas[FListaIDPessoasPermitidas.Count -1]) + ')';
     qryEstado.SQL.Text := qryEstado.SQL.Text + ' ORDER BY CODESTADO '

  end
  else
  begin

     if ListaCodEstadosPermitidos.Count > 0 then
     begin
       qryEstado.SQL.Clear;

       qryEstado.SQL.Text := ' SELECT DISTINCT 0 AS FLGENVIAR, ' +#13+
                             ' E.IDESTADO, ' +#13+
                             ' E.CODESTADO, ' +#13+
                             ' E.NOMEESTADO ' +#13+
                             ' FROM ESTADO E' +#13+
                             ' WHERE E.CODESTADO IN ( ' +#13;


       for i := 0 to ListaCodEstadosPermitidos.Count -1 do
       begin
           qryEstado.SQL.Text := qryEstado.SQL.Text + QuotedStr(ListaCodEstadosPermitidos[i]) + ', ' + #13;
       end;

       qryEstado.SQL.Text := qryEstado.SQL.Text + QuotedStr(ListaCodEstadosPermitidos[ListaCodEstadosPermitidos.Count -1]) + ')';

       qryEstado.SQL.Text := qryEstado.SQL.Text + ' ORDER BY E.CODESTADO ';
     end
     else
     begin
        qryEstado.SQL.Clear;

       qryEstado.SQL.Text := ' SELECT DISTINCT 0 AS FLGENVIAR, ' +#13+
                             ' E.IDESTADO, ' +#13+
                             ' E.CODESTADO, ' +#13+
                             ' E.NOMEESTADO ' +#13+
                             ' FROM ESTADO E' +#13+
                             ' WHERE 1=2 ';
     end;
  end;


  if (FListaIDPessoasPermitidas.Count > 0) or
     (ListaCodEstadosPermitidos.Count > 0) then
  begin
      qryEstado.Open;

      if qryEstado.IsEmpty then
          wwDBEstado.DataSource := nil;
  end
  else
      wwDBEstado.DataSource := nil;
end;

procedure TFrmDemPagSelEstado.wwDBEstadoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if AFieldName = 'FLGENVIAR' then
  begin
       qryEstado.First;

       While not qryEstado.Eof do
       begin
           qryEstado.Edit;
           if qryEstadoFLGENVIAR.AsInteger = 0
           then qryEstadoFLGENVIAR.AsInteger := 1
           else qryEstadoFLGENVIAR.AsInteger := 0;
           qryEstado.Post;
           qryEstado.Next;
       end;

       qryEstado.First;
  end;
end;

procedure TFrmDemPagSelEstado.FormCreate(Sender: TObject);
begin
  inherited;
  FListaIDPessoasPermitidas := TStringList.Create;
  FListaCodEstadosSelecionados    := TStringList.Create;

  FRetornouValor := false;
end;

procedure TFrmDemPagSelEstado.bbtnCancelarClick(Sender: TObject);
begin
  if wwDBEstado.DataSource <> nil then
     LimpaMarcacoes;
end;

procedure TFrmDemPagSelEstado.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if wwDBEstado.DataSource = nil then
  begin
     MsgDlg('É necessário selecionar pelo menos um estado para geração de arquivo de contracheque.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
     Exit;
  end;

  if TemEstadoSelecionado then
  begin
     FRetornouValor := True;

     qryEstado.First;
     ListaCodEstadosSelecionados.Clear;
     while not qryEstado.Eof do
     begin

        if qryEstadoFLGENVIAR.AsInteger = 1 then
           ListaCodEstadosSelecionados.Add(qryEstadoCODESTADO.AsString);

        qryEstado.Next;
     end;

     Close;
  end
  else
  begin
     FRetornouValor := False;
     MsgDlg('É necessário selecionar pelo menos um estado para geração de arquivo de contracheque.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
  end;
end;

function TFrmDemPagSelEstado.TemEstadoSelecionado(): Boolean;
begin
   Result := False;

   qryEstado.First;
   while not qryEstado.Eof do
   begin
       if qryEstadoFLGENVIAR.AsInteger = 1 then
       begin
           Result := True;
           break;
       end;

       qryEstado.Next;
   end;
end;

procedure TFrmDemPagSelEstado.FormDestroy(Sender: TObject);
begin
  inherited;
  if FListaIDPessoasPermitidas <> nil then FreeAndNil(FListaIDPessoasPermitidas);
  if FListaCodEstadosSelecionados    <> nil then FreeAndNil(FListaCodEstadosSelecionados);

  FRetornouValor := False;
end;


procedure TFrmDemPagSelEstado.LimpaMarcacoes;
begin
  qryEstado.First;

  While not qryEstado.Eof do
  begin
    qryEstado.Edit;

    qryEstadoFLGENVIAR.AsInteger := 0;

    qryEstado.Post;
    qryEstado.Next;
  end;

  qryEstado.First;
end;

end.
