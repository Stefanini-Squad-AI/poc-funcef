unit uCtrlConsSaldoFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     Wwquery, uCMTypes;

type
   TCtrlConsSaldoFinanc = Class(TCmControlObject)

   private

      F_rIDPessoa      : Double;
      F_rIDModulo      : Double;
      F_rIDUsuario     : Double;
      F_bUsaPlanoPatro : Boolean;


   public

      property IDPessoa: Double write F_rIDPessoa;
      property IDModulo: Double write F_rIDModulo;
      property IDUsuario: Double write F_rIDUsuario;
      property UsaPlanoPatro: Boolean write F_bUsaPlanoPatro;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure GeraTotais(var rTotalEntradas, rTotalSaidas: Double;
                           rIDPrograma, rIDpatro, rIDPlanoPrev: Double;
                           dDataInicial, dDataFinal: TDateTime);

      function ListEntradas(rIDPrograma, rIDpatro, rIDPlanoPrev: Double;
                            dDataInicial, dDataFinal: TDateTime): OleVariant;

      function ListSaidas(rIDPrograma, rIDpatro, rIDPlanoPrev: Double;
                          dDataInicial, dDataFinal: TDateTime): OleVariant;

      function MontaFiltroSql(sSql: String;
                              rIDPrograma, rIDpatro, rIDPlanoPrev: Double;
                              dDataInicial, dDataFinal: TDateTime): String;


   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TCtrlConsSaldoFinanc }



constructor TCtrlConsSaldoFinanc.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   Inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;
end;



destructor TCtrlConsSaldoFinanc.Destroy;
begin
   inherited;
end;



procedure TCtrlConsSaldoFinanc.DoChangeDataBase;
begin
   inherited;
end;



procedure TCtrlConsSaldoFinanc.GeraTotais(var rTotalEntradas, rTotalSaidas: Double;
                                          rIDPrograma, rIDpatro, rIDPlanoPrev: Double;
                                          dDataInicial, dDataFinal: TDateTime);
var
   sSql : String;
begin
   with TCMClientDataSet.Create(nil) do
   try
      sSql:=MontaFiltroSql('SELECT '+
                           '   Sum(Decode(EntradaSaida,'+#39+'E'+#39+',MF.ValorLancFinan)) '+
                           '   AS TotEntradas, '+
                           '   Sum(Decode(EntradaSaida,'+#39+'S'+#39+',MF.ValorLancFinan)) '+
                           '   AS TotSaidas   '+
                           'FROM MovimFinanc MF, RateioFinanc RF '+
                           'WHERE (MF.CodLancFinanc(+)=RF.CodLancFinanc) ',rIDPrograma,rIDpatro,
                           rIDPlanoPrev,dDataInicial,dDataFinal);

      Data:=GetDataPacket(sSql);
      
      rTotalEntradas:=FieldByName('TotEntradas').AsFloat;
      rTotalSaidas:=FieldByName('TotSaidas').AsFloat;
   finally
      Free;
   end;
end;



function TCtrlConsSaldoFinanc.ListEntradas(rIDPrograma, rIDpatro,
  rIDPlanoPrev: Double; dDataInicial, dDataFinal: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:=MontaFiltroSql('SELECT MF.Historico, MF.ValorLancFinan '+
                        'FROM MovimFinanc MF, RateioFinanc RF '+
                        'WHERE (MF.CodLancFinanc(+)=RF.CodLancFinanc) AND '+
                        '      (MF.EntradaSaida=''E'')',rIDPrograma,rIDpatro,
                        rIDPlanoPrev,dDataInicial,dDataFinal);
   Result:=GetDataPacket(sSql);
end;



function TCtrlConsSaldoFinanc.ListSaidas(rIDPrograma, rIDpatro,
  rIDPlanoPrev: Double; dDataInicial, dDataFinal: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:=MontaFiltroSql('SELECT MF.Historico, MF.ValorLancFinan '+
                        'FROM MovimFinanc MF, RateioFinanc RF '+
                        'WHERE (MF.CodLancFinanc(+)=RF.CodLancFinanc) AND '+
                        '      (MF.EntradaSaida=''S'') ',rIDPrograma,rIDpatro,
                        rIDPlanoPrev,dDataInicial,dDataFinal);
   Result:=GetDataPacket(sSql);
end;



function TCtrlConsSaldoFinanc.MontaFiltroSql(sSql: String; rIDPrograma,
  rIDpatro, rIDPlanoPrev: Double; dDataInicial, dDataFinal: TDateTime): String;
begin
   Result:=sSql;
   if F_bUsaPlanoPatro then
    begin
       if (rIDPrograma>0) then
          Result:=Result+' AND (RF.IDPrograma='+FloatToStr(rIDPrograma)+') ';

       if (rIDpatro>0) then
          Result:=Result+' AND (RF.IDPatro='+FloatToStr(rIDpatro)+') ';

       if (rIDPlanoPrev>0) then
          Result:=Result+' AND (RF.IDPlanoPrev='+FloatToStr(rIDPlanoPrev)+') ';
    end;

   if (dDataInicial<>0) then
      Result:=Result+' AND (MF.DataLancFinan>=To_Date('''+
                     FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy'')) ';

   if (dDataFinal<>0) then
      Result:=Result+' AND (MF.DataLancFinan<=To_Date('''+
                     FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''dd/mm/yyyy'')) ';

   Result:=Result+' AND (MF.IDPESSOA(+)= '+FloatToStr(F_rIDPessoa)+')';
end;



end.
