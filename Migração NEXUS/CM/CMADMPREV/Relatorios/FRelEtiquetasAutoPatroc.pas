{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Marcio Sanches Spinosa
// Data        : 23/04/2012
// Alteração   : Criação do relatório de emissão de etiquetas.
//------------------------------------------------------------------------------
unit fRelEtiquetasAutoPatroc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, MontaSelect,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, Spin, FPreview;

type
  TfrmRelEtiquetasAutoPatroc = class(TfrmOkCancelar)
    MontaSelectPart: TMontaSelect;
    grpPosicionamento: TGroupBox;
    spedAlturaEtiqueta: TSpinEdit;

    lbl1: TLabel;
    lbl2: TLabel;
    SpedQuantidadeColunas: TSpinEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    spedMargemSuperior: TSpinEdit;
    lbl5: TLabel;
    spedMargemEsquerda: TSpinEdit;
    grp1: TGroupBox;
    grp2: TGroupBox;
    chkREB: TCheckBox;
    chkREGREPLAN: TCheckBox;
    chkNovoPlano: TCheckBox;
    chkLicenciados: TCheckBox;
    chkAutoPatrocinados: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function validaCampos() : Boolean;
    function montaSQLRelatorio(pStrFiltro : string) : string;
    function montaFiltro(pREB : Boolean; pREGREPLAN : Boolean; pNovoPlano : Boolean; pLicenciados  : Boolean; pAutoPatrocinados : Boolean) : string;
    procedure configuraRelatorio(pAlturaEtiqueta, pQtdeColunas, pMargemSuperior, pMargemEsquerda : Integer);
    procedure LimparVariaveis;
   public
    { Public declarations }
     pFiltroLeft    : string;
  end;

var
  frmRelEtiquetasAutoPatroc: TfrmRelEtiquetasAutoPatroc;
  qryRelatorioEtiqueta : TwwQuery;
  const ALTURA_LINHA   = 5;
  const TAMANHO_PIXEL  = 0.265;


implementation

uses DRelatGerencial;

{$R *.DFM}

{ TfrmRelEtiquetasAutoPatroc }

function TfrmRelEtiquetasAutoPatroc.validaCampos: Boolean;
var isValidaCampo : Boolean;
begin
  try
  isValidaCampo := True;

  //Verifica os limites da altura da etiqueta
    if (spedAlturaEtiqueta.Value <= 0) then
    begin
      ShowMessage('É necessário informar a altura da etiqueta.');
      isValidaCampo := False;
    end
    else
    if (spedAlturaEtiqueta.Value > 5) then
    begin
      ShowMessage('A altura da etiqueta não pode ser maior 5.');
      isValidaCampo := False;
    end
    //Verifica os limites da altura da etiqueta

    //Valida os limites das colunas do relatório
    else
    if (SpedQuantidadeColunas.Value <= 0) then
    begin
      ShowMessage('É necessário informar a quantidade de colunas.');
      isValidaCampo := False;
    end
    else
    if (SpedQuantidadeColunas.Value > 3) then
    begin
      ShowMessage('A quantidade de colunas não pode ser maior que 3.');
      isValidaCampo := False;
    end
    //Valida os limites das colunas do relatório
    else
    if (spedMargemSuperior.Value <= 0) then
    begin
      ShowMessage('É necessário informar a margem superior.');
      isValidaCampo := False;
    end
    else
    if (spedMargemEsquerda.Value <= 0) then
    begin
      ShowMessage('É necessário informar a margem esquerda.');
      isValidaCampo := False;
    end
     else
    if (chkREB.Checked = False) and (chkREGREPLAN.Checked = false) and (chkNovoPlano.Checked = false) then
    begin
      ShowMessage('É necessário selecionar pelo menos um plano previdenciário para a emissão da etiquetas.');
      isValidaCampo := False;
    end
    else
    if (chkLicenciados.Checked = false) and (chkAutoPatrocinados.Checked = false) then
    begin
      ShowMessage('É necessário selecionar pelo menos uma situação de participante para a emissão da etiquetas.');
      isValidaCampo := False;
    end;

    Result := isValidaCampo;
  except
    on E : exception do
    begin
      raise exception.Create('Erro ao validar os campos');
    end;
  end;
end;

procedure TfrmRelEtiquetasAutoPatroc.bbtnConfirmarClick(Sender: TObject);
var Filtro : string;
begin
  try
    //Valida os campos conforme a regra de negócio
    if (validaCampos) then
    begin
      //Verifica se esta instanciada a DtmRelatorioGerencial
       if not Assigned(dtmRelatorioGerencial) then
          dtmRelatorioGerencial := TdtmRelatorioGerencial.Create(nil);

       //Começa a montar o relatório
       with dtmRelatorioGerencial do
       begin
         //Configura os parametros de do relatorio como margem, altura de linha e qtde de colunas
         configuraRelatorio(spedAlturaEtiqueta.Value, SpedQuantidadeColunas.Value, spedMargemSuperior.Value, spedMargemEsquerda.Value);
         //Monta o filtro das pessoas conforme os parametros
         Filtro := montaFiltro(chkREB.Checked, chkREGREPLAN.Checked, chkNovoPlano.Checked, chkLicenciados.Checked, chkAutoPatrocinados.Checked);
         //Manda os selects de endereços para a qry
         qryRelatorioEtiqueta.Close;
         qryRelatorioEtiqueta.SQL.Clear;
         qryRelatorioEtiqueta.SQL.Add(montaSQLRelatorio(Filtro));
         qryRelatorioEtiqueta.open;
         qryRelatorioEtiqueta.DisableControls;
         //Faz a chamada do relatorio em si
         TfrmPreview.CreateModalPreview(Application,
                                           dtmRelatorioGerencial.ppRelatorioEtiqueta,
                                           dtmRelatorioGerencial.ppRelatorioEtiqueta.PrinterSetup.DocumentName);
         qryRelatorioEtiqueta.EnableControls;
         LimparVariaveis;
       end;
    end
    else
      Exit;
  Except
    on E : Exception do
    begin
      raise exception.Create('Erro ao montar o relatório');
    End;
  end;
end;

procedure TfrmRelEtiquetasAutoPatroc.FormCreate(Sender: TObject);
begin
  inherited;
  //instancia a DTMRelatorioGerencial
  dtmRelatorioGerencial := TdtmRelatorioGerencial.Create(nil);
  qryRelatorioEtiqueta  := TwwQuery.Create(nil);
  qryRelatorioEtiqueta.DatabaseName := 'BaseDados';

end;

procedure TfrmRelEtiquetasAutoPatroc.configuraRelatorio(pAlturaEtiqueta,
  pQtdeColunas, pMargemSuperior, pMargemEsquerda: Integer);
begin
   try
     if Assigned(dtmRelatorioGerencial) then
     begin
        with dtmRelatorioGerencial do
        begin
           //Configura os parametros do relatorio         
           ppRelatorioEtiqueta.Columns := pQtdeColunas;
           ppRelatorioEtiqueta.PrinterSetup.MarginTop := pMargemSuperior;
           ppRelatorioEtiqueta.PrinterSetup.MarginLeft := pMargemEsquerda;
           ppDetalheRelatorioEtiqueta.Height :=  (pAlturaEtiqueta * ALTURA_LINHA) * 19 * TAMANHO_PIXEL;
        end;
     end;
   except
      on E : exception do
      begin
        raise exception.Create('Erro ao configurar os parametros do relatório');
      end;
   end;
end;


function TfrmRelEtiquetasAutoPatroc.montaSQLRelatorio(pStrFiltro : string): string;
  var StrSqlRelatorio : string;
begin
  try
      StrSqlRelatorio := 'SELECT  P.NOME, EP.LOGRADOURO, EP.BAIRRO, ''CEP: '' || EP.CEP AS CEP, CID.NOME AS CIDADE, EP.CODESTADO, ' +
                       ' ''CE: '' || PP.CE AS CE,  ''NUP: '' || PP.NUP AS NUP' +
                       ' FROM ENDPESS EP ' +
                       ' INNER JOIN PESSOA P ON (P.IDPESSOA = EP.IDPESSOA) ' +
                       ' INNER JOIN CIDADES CID ON (CID.IDCIDADES = EP.IDCIDADES) ' +
                       ' LEFT JOIN PESSOAPARAM PP ON (PP.IDPESSOA = P.IDPESSOA AND PP.IDPARAM IN (' + pFiltroLeft + ')) ' +
                       ' WHERE P.IDPESSOA IN (' + pStrFiltro + ') ' +
                       ' ORDER BY P.NOME ' ;

       Result := StrSqlRelatorio;
  except
      on E : exception do
      begin
        raise exception.Create('Erro ao buscar as informações do banco de dados');
      end;
  end;
end;

function TfrmRelEtiquetasAutoPatroc.montaFiltro(pREB, pREGREPLAN, pNovoPlano,
  pLicenciados, pAutoPatrocinados: Boolean): string;
var pStrFiltro, pStrRetorno, pStrAnoMes : string;
    pQry    : TwwQuery;
begin
  try

    if (pREB) then
    begin
       if (pStrFiltro = EmptyStr) then
           pStrFiltro := ' 66, 19, 79 '
       else
           pStrFiltro :=   pStrFiltro + ' , 66, 19, 79 ';
    end;

    if (pREGREPLAN) then
    begin
       if (pStrFiltro = EmptyStr) then
           pStrFiltro := ' 2 '
       else
           pStrFiltro :=   pStrFiltro + ' , 2 ';
    end;

    if (pNovoPlano) then
    begin
       if (pStrFiltro = EmptyStr) then
           pStrFiltro := ' 74 '
       else
           pStrFiltro :=   pStrFiltro + ' , 74 ';
    end;

    pQry := TwwQuery.Create(nil);
    pQry.DatabaseName := 'BaseDados';

    If (pLicenciados) then
    begin

       pQry.Close;
       pQry.SQL.Clear;
       pQry.SQL.Add('SELECT PE.IDPESSOA ' +
                    ' FROM PESSOA       PE, ' +
                    ' ELEGPATRO    E, ' +
                    ' PARTPREVPLAN P, ' +
                    ' SITFUNC      SF, ' +
                    ' SITPART      ST, ' +
                    ' PLANPREV     PP, ' +
                    ' EVENTOSPREV  EV ' +
                    ' WHERE PE.IDPESSOA = E.IDPESSOA '+
                    ' AND E.IDPESSOA = P.IDPESSOA '+
                    ' AND EV.IDPESSOA = P.IDPESSOA ' +
                    ' AND EV.IDPESSOA = PE.IDPESSOA ' +
                    ' AND EV.IDSITPARTNOVO = ST.IDSITPART '+
                    ' AND E.IDSITFUNC = SF.IDSITFUNC '+
                    ' AND P.IDSITPART = ST.IDSITPART ' +
                    ' AND ST.IDSITPART = 83 '+
                    ' AND P.FLGDESATIVADO = 0 ' +
                    ' AND P.IDPLANOPREV = PP.IDPLANOPREV ' +
                    ' AND PP.IDPLANOPREV IN (' + pStrFiltro + ' ) '+
                    ' and e.datademissao is null ');
//                     +
//                    ' AND NOT EXISTS (SELECT 1 ' +
//                    ' FROM PESSOAPARAM g '+
//                    ' WHERE g.IDPESSOA = E.IDPESSOA ' +
//                    ' AND IDPARAM =  156 '+
//                    ' and g.datainicio is not null) ');
      pQry.Open;

      if (pQry.RecordCount > 0) then
      begin
        while not pQry.Eof do
        begin
          if (pStrRetorno = EmptyStr) then
             pStrRetorno := pQry.FieldByName('IDPESSOA').AsString
          else
             pStrRetorno := pStrRetorno + ', ' + pQry.FieldByName('IDPESSOA').AsString;

          pQry.Next;
        end;
      end;
    end;


      if (pAutoPatrocinados) then
      begin

        pStrAnoMes :=  FormatDateTime('yyyy/mm', Now);

        pQry.Close;
        pQry.SQL.Clear;
        pqry.sql.add('SELECT DADOS.IDPESSOA ' +
                     ' FROM PESSOA P, ' +
                     ' CONTABANCARIA CB, '+
                     ' AGENCIABANCARIA AB, ' +
                     ' ( SELECT H.IDPESSOA, ' +
                     ' PP.DATAINICIOMANUT, ' +
                     ' E.MATRICULA, '+
                     ' P.NOME, ' +
                     ' P.NUMDOCUMENTO, '+
                     ' H.DATAPREVISAORECE, '+
                     ' SUM(H.VALORESPERADO) AS TOTAL, '+
                     ' DECODE (PP.IDPLANOPREV,''2'',''REG/REPLAN'',''19'',''REB 1998'',''66'',''REB'',''74'',''NOVO PLANO'', '+
                     '''79'',''REB FUNCEF'',''110'',''PGA - Plano de Gestão administrativa'') AS PLANO, '+
                     ' DECODE (PP.IDPESSJUR, 1, ''FUNCEF'', 91008,''CAIXA'') AS PATRO, '+
                     ' DECODE(H.FLGDEVOLUCAO, 0, DECODE( H.SITRECEBIMENTO, ''0'', ''Não enviada para cobrança'', '+
                     '''1'', ''Enviada e não recebida'', ' +
                     '''2'',''Recebida corretamente'', '+
                     '''3'', ''Recebida com divergência(NT)'', ' +
                     '''4'', ''Atrasada e já tratada'', ' +
                     '''5'', ''Divergência paga'', '+
                     '''6'', ''Divergência enviada e não recebida'', '+
                     '''7'', ''Financiada ou Renegociada'', ' +
                     '''8'', ''Cancelada'', ' +
                     '''9'', ''Cobrada na Folha de Benefício''), ' +
                     ' DECODE( H.SITRECEBIMENTO, ''0'', ''Não enviada para devolução'', ' +
                     '''1'', ''Enviada e não efetivamente paga'', ' +
                     '''2'', ''Paga corretamente'' , ' +
                     '''3'', ''Paga com divergência(NT)'', ' +
                     '''7'', ''Financiada ou Renegociada'', ' +
                     '''8'', ''Cancelada'', ' +
                     '''9'', ''Paga na Folha de Benefício'')) AS NOMESITUACAO, ' +
                     ' H.MESCOBRANCA, MIN(H.MESREFERENCIA) MESMENOR, MAX(H.MESREFERENCIA) MESMAIOR ' +
                     ' FROM HSTCONTRIBPREV H, ' +
                     ' ELEGPATRO E, ' +
                     ' PESSOA P, ' +
                     ' PARTPREVPLAN PP ' +
                     ' WHERE H.IDPLANOPREV IN (' + pStrFiltro + ') ' +
                     ' AND E.IDPESSJUR = H.IDPESSJUR ' +
                     ' AND E.IDPESSOA = H.IDPESSOA '+
                     ' AND E.IDSITFUNC IN (36,35,34,49) '+
                     ' AND P.IDPESSOA = H.IDPESSOA '+
                     ' AND P.IDPESSOA = E.IDPESSOA ' +
                     ' AND PP.IDPESSOA = E.IDPESSOA '+
                     ' AND H.IDPESSOA = PP.IDPESSOA '+
                     ' AND H.IDPLANOPREV = PP.IDPLANOPREV '+
                     ' AND PP.IDSITPLANOPREV = 1 ' +
                     ' AND PP.IDSITPART = 2 '+
                     ' AND H.IDCONTRIBUICAO IN (18,19) ' +
                     ' AND H.MESREFERENCIA <= ' + QuotedStr(pStrAnoMes) +
                     ' AND H.SITRECEBIMENTO = 0 ' +
                     ' GROUP BY H.IDPESSOA, E.MATRICULA, P.NOME, P.NUMDOCUMENTO, H.DATAPREVISAORECE, '+
                     ' PP.IDPLANOPREV, PP.IDPESSJUR, H.FLGDEVOLUCAO, H.SITRECEBIMENTO, H.IDCONTRIBUICAO, '+
                     ' H.MESCOBRANCA  , PP.DATAINICIOMANUT ORDER BY NOMESITUACAO, P.NOME) DADOS '+
                     ' WHERE CB.IDPESSOA (+) = P.IDPESSOA AND AB.IDPESSOA (+) = CB.IDAGENCIA '+
                     ' AND P.IDPESSOA = DADOS.IDPESSOA AND DADOS.IDPESSOA = CB.IDPESSOA '+
                     ' AND CB.FLGCONTAPREF = 1 AND TOTAL > 0 '+
                     ' GROUP BY DADOS.IDPESSOA ');

        pqry.open;

        if (pqry.RecordCount > 0) then
        begin
          while not pqry.eof do
          begin
            if (pStrRetorno = EmptyStr) then
              pStrRetorno := pQry.FieldByName('IDPESSOA').AsString
            else
              pStrRetorno := pStrRetorno + ', ' + pQry.FieldByName('IDPESSOA').AsString;

              pQry.Next;
          end;
        end;
      end;

      if (pLicenciados) then
      begin
        if (pFiltroLeft = EmptyStr) then
           pFiltroLeft := ' 156 '
        else
           pFiltroLeft := pFiltroLeft + ', 156 ';
      end;

      if (pAutoPatrocinados) then
      begin
        if (pFiltroLeft = EmptyStr) then
           pFiltroLeft := ' 159 '
        else
           pFiltroLeft := pFiltroLeft + ', 159 ';
      end;

        Result := pStrRetorno;

  except
    on e : exception do
    begin
      raise exception.Create('Erro ao montar os filtros do relatório');
    end;
  end;
end;

procedure TfrmRelEtiquetasAutoPatroc.FormShow(Sender: TObject);
begin
  inherited;
   pFiltroLeft := EmptyStr;
end;

procedure TfrmRelEtiquetasAutoPatroc.LimparVariaveis;
begin
 pFiltroLeft := EmptyStr;
end;

procedure TfrmRelEtiquetasAutoPatroc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(qryRelatorioEtiqueta);
end;

end.
