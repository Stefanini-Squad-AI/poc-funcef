unit uCtrlListTerceiros;

interface

Uses DB,  uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables;

  Type
    TTipoAtivProj = (tapSoSinteticaAP,tapSoAnaliticaAP,tapAmbos);
       { toapCodigo  => Ordernar as Ativ/Proj por codigo
         toapNome    => Ordernar as Ativ/Proj por nome
       }
    TTipoOrdemAtivProj  = (toapCodigo, toapNome);


    TCtrlListTerceiros = Class(TCmControlObject)

    private
    protected

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      function ListPlanoPrev  :OleVariant;
      function ListPlanoPatro :OleVariant;
      function ListMoeda      :OleVariant;
      function ListAtivProj(dIdEmpresa,dUnidNegoc:Double;sUneCodigo:String;
               TipoAtivProj: TTipoAtivProj;TipoOrdemAtivProj: TTipoOrdemAtivProj) :OleVariant;

      function ListCentroCusto(dIdEmpresa :Double;sCodCCusto,sTipo :string) :OleVariant;
      function ListTipoOper(bOrdenaTipoOper: Boolean): OleVariant;
      function ListEmpresaProp(dIdPessoa:Double):OleVariant;
      Function ListCdsMoedaSaldo :OleVariant;

    End;


implementation

constructor TCtrlListTerceiros.Create;
begin
  inherited;
end;

destructor TCtrlListTerceiros.Destroy;
begin
  inherited;
end;

function TCtrlListTerceiros.ListTipoOper(bOrdenaTipoOper: Boolean): OleVariant;
var
  sSql, sOrdena :string;
begin
      sSql := 'SELECT  ' +
              'TIPCODIGO, TIPDESCRICAO ' +
              'FROM TIPOPER ';

      If bOrdenaTipoOper Then
         sOrdena := 'ORDER BY TIPCODIGO '
      Else
         sOrdena := 'ORDER BY TIPDESCRICAO ';

     sSql := sSql + sordena;

     Result := GetDataPacket(sSql);
End;

function TCtrlListTerceiros.ListEmpresaProp(dIdPessoa: Double): OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT  ' +
              '   IDPESSOA, NOMEEMPRESA,TIPOEMPRESA ' +
              'FROM  ' +
              '   EMPRESAPROP ' +
              'WHERE ' +
              '   (IDPESSOA <> ' + FloatToStr(dIdPessoa) + ') ' +
              'ORDER BY ' +
              '   NOMEEMPRESA ';


     Result := GetDataPacket(sSql);
End;

function  TCtrlListTerceiros.ListPlanoPrev :OleVariant;
var
  sSql :string;
begin
       sSql := 'SELECT  '+
               '  IDPLANOPREV, NOME ' +
               'FROM  PLANPREVCONTABIL ' +
               'ORDER BY NOME  ';

       Result := GetDataPacket(sSql);

end;
function  TCtrlListTerceiros.ListCentroCusto(dIdEmpresa:Double;sCodCCusto,sTipo:string) :OleVariant;
var
  sSql, sFiltro :string;
begin
       sSql := 'SELECT  '+
               '   IDEMPRESA,      ' +
               '   CODCENTROCUSTO, ' +
               '   IDPROGRAMA,     ' +
               '   IDUSUARIO,      ' +
               '   NOME,           ' +
               '   STATUSGRUPOCDC, ' +
               '   RESPONSAVEL,    ' +
               '   CODREDUZIDO,    ' +
               '   ATIVO,          ' +
               '   CODCORRESP      ' +
               'FROM ' +
               '   CENTCUST ';
      //----------------------------------------------------------
      sFiltro := '';
      If (dIdEmpresa <> 0) Then
         sFiltro :=  'WHERE (IDEMPRESA = '+FloatToStr(dIdEmpresa)+ ') ';
     //----------------------------------------------------------
      If sCodCCusto <> ''  then
         If sFiltro = '' Then
            sFiltro :=  'WHERE (RTRIM(CODCENTROCUSTO) = ''' + Trim(sCodCCusto) + ''') '
         Else
            sFiltro := sFiltro +  'AND (RTRIM(CODCENTROCUSTO) = ''' + Trim(sCodCCusto) + ''') ';
     //----------------------------------------------------------
      If (sTipo  <> '')  then
      Begin
         If (sTipo = 'A') or (sTipo = 'a')  then
         Begin
           If sFiltro = '' Then
              sFiltro :=  'WHERE (RTRIM(STATUSGRUPOCDC = ''' + Trim(sTipo) + ''') '
           Else
             sFiltro := sFiltro +  'AND (RTRIM(STATUSGRUPOCDC) = ''' + Trim(sTipo) + ''') ';
          End;

          If (sTipo = 'S') or (sTipo = 's')  then
          Begin
            If sFiltro = '' Then
               sFiltro :=  'WHERE (RTRIM(STATUSGRUPOCDC = ''' + Trim(sTipo) + ''') '
            Else
              sFiltro := sFiltro +  'AND (RTRIM(STATUSGRUPOCDC) = ''' + Trim(sTipo) + ''') ';
          End;
      End;
     //----------------------------------------------------------

     sSql := sSql + sFiltro;

     Result := GetDataPacket(sSql);

end;


function  TCtrlListTerceiros.ListAtivProj(dIdEmpresa,dUnidNegoc:Double;sUneCodigo:String;
        TipoAtivProj: TTipoAtivProj;TipoOrdemAtivProj: TTipoOrdemAtivProj) :OleVariant;
var
  sSql, sFiltro :string;
begin
      sSql := 'SELECT             ' +
              '   UNECODIGO,      ' +
              '   NOME,           ' +
              '   UNIDNEGOC,      ' +
              '   UNETIPO         ' +
              'FROM               ' +
              '   UNIDNEGOCIO     ';

      sFiltro := '';
      If (dIdEmpresa <> 0) Then
         sFiltro :=  'WHERE (IDPESSOA = '+FloatToStr(dIdEmpresa)+ ') ';


      If dUnidNegoc <> 0 then
         If sFiltro = '' Then
            sFiltro :=  'WHERE (UNIDNEGOC = '+FloatToStr(dUnidNegoc)+') '
         Else
            sFiltro := sFiltro +  'AND (UNIDNEGOC = '+FloatToStr(dUnidNegoc)+') ';

      If sUneCodigo <> '' then
         If sFiltro = '' Then
            sFiltro :=  'WHERE (RTRIM(UNECODIGO) = ' + Trim(sUneCodigo) + ') '
         Else
            sFiltro := sFiltro +  'AND (RTRIM(UNECODIGO) = ' + Trim(sUneCodigo) + ') ';

      Case TipoAtivProj of
         tapSoSinteticaAP : sFiltro := sFiltro + '  AND (UNETIPO = ''S'') ';
         tapSoAnaliticaAP : sFiltro := sFiltro + '  AND (UNETIPO = ''A'') ';
      end;

      Case TipoOrdemAtivProj of
         toapCodigo : sFiltro := sFiltro + 'ORDER BY UNECODIGO ';
         toapNome   : sFiltro := sFiltro + 'ORDER BY NOME      ';
      end;

      sSql := sSql + sfiltro;

      Result := GetDataPacket(sSql);

end;

function  TCtrlListTerceiros.ListPlanoPatro :OleVariant;
var
  sSql :string;
begin
       sSql := 'SELECT  ' +
               '   P.NOME, PT.IDPESSOA '+
               'FROM '+
               '   PESSOA P, PATRO PT '+
               'WHERE ' +
               '   (P.IDPESSOA = PT.IDPESSOA) ';

       Result := GetDataPacket(sSql);
end;

function  TCtrlListTerceiros.ListMoeda :OleVariant;
var
  sSql :string;
begin
       sSql := 'SELECT  ' +
               '   MOECODIGO, MOEDESC, MOESIGLA ' +
               'FROM '+
               '   MOEDA ';

       Result := GetDataPacket(sSql);
end;

function TCtrlListTerceiros.ListCdsMoedaSaldo: OleVariant;
var
  sSql :string;
begin
       sSql := 'SELECT MOECODIGO,MOEDESC,MOESIGLA FROM MOEDA '+
                'WHERE  (MOEINATIVO = ''A'' )' +
                'ORDER BY MOEDESC ';


       Result := GetDataPacket(sSql);

end;

end.
